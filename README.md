# README

## Setup

```
bundle
make
make setup
bin/rails server
```

## CRUD via API

### create

```
make create name="my name"
```

```json
{
  "id": 1,
  "name": "my name",
  "dob": null,
  "bio": null,
  "created_at": "2022-10-25T10:02:24.528Z",
  "updated_at": "2022-10-25T10:02:24.528Z",
  "url": "http://127.0.0.1:3000/users/1.json"
}
```

### read

```
make read user_id=1
```

```json
{
  "id": 1,
  "name": "my name",
  "dob": null,
  "bio": null,
  "created_at": "2022-10-25T10:02:24.528Z",
  "updated_at": "2022-10-25T10:02:24.528Z",
  "url": "http://127.0.0.1:3000/users/1.json"
}
```

### update

```
make update user_id=1 bio="my new bio"
```

```json
{
  "id": 1,
  "name": "my name",
  "dob": null,
  "bio": "my new bio",
  "created_at": "2022-10-25T10:02:24.528Z",
  "updated_at": "2022-10-25T10:03:06.814Z",
  "url": "http://127.0.0.1:3000/users/1.json"
}
```

### delete

```
make delete user_id=1
```

### get all

```
make create name="Alice"
make create name="Jhonny"
make create name="Ben"

make get-all
```

```json
[
  {
    "id": 2,
    "name": "Alice",
    "dob": null,
    "bio": null,
    "created_at": "2022-10-25T10:03:33.260Z",
    "updated_at": "2022-10-25T10:03:33.260Z",
    "url": "http://127.0.0.1:3000/users/2.json"
  },
  {
    "id": 3,
    "name": "Jhonny",
    "dob": null,
    "bio": null,
    "created_at": "2022-10-25T10:03:39.418Z",
    "updated_at": "2022-10-25T10:03:39.418Z",
    "url": "http://127.0.0.1:3000/users/3.json"
  },
  {
    "id": 4,
    "name": "Ben",
    "dob": null,
    "bio": null,
    "created_at": "2022-10-25T10:03:45.180Z",
    "updated_at": "2022-10-25T10:03:45.180Z",
    "url": "http://127.0.0.1:3000/users/4.json"
  }
]
```

### Cleanup

```
make clean
```
