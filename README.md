## Running Locally

```sh
git clone git@github.com:apoyan/im_proxy.git
cd im_proxy
bundle install
bundle exec rails db:create
bundle exec rails migrate
bundle exec sidekiq -L log/sidekiq.log
bundle exec rails server
```

## Usage

### POST /magazines/[id]/articles

Response body:
```sh
{
    "message": {
        "body": "lorem ipsum",
        "receivers": [
            {
                "messenger": "telegram",
                "datetime": "",
                "user_ids": ["vasya.pupkin", "grigoriy123"]
            }
        ]
    }
}
```

Success response:
```sh
{
    "success": true,
    "results": [
        {
            "user_id": "vasya.pupkin",
            "messenger": "telegram",
            "status": "passed",
            "error": null
        },
        {
            "user_id": "grigoriy123",
            "messenger": "telegram",
            "status": "passed",
            "error": null
        }
    ]
}
```


Failure response:
```sh
{
    "success": true,
    "results": [
        {
            "user_id": "vasya.pupkin",
            "messenger": "telegram",
            "status": "failed",
            "error": [
                "user_id",
                "has already been taken"
            ]
        },
        {
            "user_id": "grigoriy123",
            "messenger": "telegram",
            "status": "failed",
            "error": [
                "user_id",
                "has already been taken"
            ]
        }
    ]
}
```

Invalid params:
```sh
{
    "errors": {
        "receivers": {
            "0": {
                "messenger": [
                    "must be one of: viber, telegram, whatsapp"
                ]
            }
        }
    }
}
```
