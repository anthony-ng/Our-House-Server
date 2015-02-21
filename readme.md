# Our House - Server side (API)

**Rails version 4.2.0**

## Users

**get /users**<br>
Returns an array of all users **who are associated** with the current user/in the same house

```
    [{
    id: 1,
    name: "charles",
    nickname: null,
    image: null,
    email: null,
    house_id: 1,
    created_at: "2015-02-16T03:05:00.300Z",
    updated_at: "2015-02-16T03:05:00.300Z"
    },
    {
    id: 2,
    name: "brian",
    nickname: null,
    image: null,
    email: null,
    house_id: 1,
    created_at: "2015-02-16T03:05:00.303Z",
    updated_at: "2015-02-16T03:05:00.303Z"
    }]
```

**get /users/:id**<br>
returns a user object

```
    {
    id: 1,
    name: "charles",
    nickname: null,
    image: null,
    email: null,
    house_id: 1,
    created_at: "2015-02-16T03:05:00.300Z",
    updated_at: "2015-02-16T03:05:00.300Z"
    }
```

**post /users** <br>
create a user<br>
Returns created user object, otherwise returns a 400 status + error message <br>
**This needs to be implimented on the client/server so when a user logs in on the client it finds or creates the user**
```
    {
    id: 2,
    name: "charles",
    nickname: null,
    image: null,
    email: null,
    house_id: 1,
    created_at: "2015-02-16T03:05:00.300Z",
    updated_at: "2015-02-16T03:05:00.300Z"
    }
```

## Houses
**post /users/:id/houses** <br>
Create a house <br>
- Must include ```params[:house]```
  - ```"name" => 'DevBootCamp House'```<br>
Returns created house object, otherwise returns a 400 status + error message
```
    {
    id: 1,
    name: "devbootcamp",
    created_at: "2015-02-16T03:05:00.275Z",
    updated_at: "2015-02-16T03:05:00.275Z"
    }
```

**get /users/:id/houses/:house_id**<br>
Returns a house object
```
    {
    id: 1,
    name: "devbootcamp",
    created_at: "2015-02-16T03:05:00.275Z",
    updated_at: "2015-02-16T03:05:00.275Z"
    }
```
## Messages

**post /users/:user_id/houses/:house_id/messages** <br>
Create message(task, notif, activity)<br>
- Must include ```params[:message]``` with
  - ```"type" => "Notif"``` or
  - ```"type" => "Task"``` or
  - ```"type" => "Activity"``` and
  - ```"content" => "Go out and by us beer!"```
Returns object it created, otherwise it returns a 403 with an error

```
    {
    id: 1,
    user_id: 1,
    house_id: 1,
    content: "clean shit up",
    created_at: "2015-02-16T03:05:00.332Z",
    updated_at: "2015-02-16T03:05:00.332Z"
    }
```

**get /users/:user_id/houses/:house_id/messages**<br>
Returns an array of all messages for a user, along with the message's view<br>
i.e. <br>
```message[0]``` is the message object <br>
```message[0].content``` == ```"clean shit up"```<br>
```message[0].view``` is the nested view object<br>
```message[0].view.read``` == ```true```<br>
**route response:**
```
    [{
    id: 1,
    user_id: 1,
    house_id: 1,
    content: "clean shit up",
    created_at: "2015-02-16T03:05:00.332Z",
    updated_at: "2015-02-16T03:05:00.332Z",
    view: {
        message_id: 1,
        id: 1,
        user_id: 1,
        read: true,
        removed: false,
        created_at: "2015-02-16T03:05:00.356Z",
        updated_at: "2015-02-16T03:05:00.371Z"
        }
    },
    {
    id: 2,
    user_id: 1,
    house_id: 1,
    content: "cook food",
    created_at: "2015-02-16T03:05:00.375Z",
    updated_at: "2015-02-16T03:05:00.375Z",
    view: {
        message_id: 2,
        id: 6,
        user_id: 1,
        read: true,
        removed: false,
        created_at: "2015-02-16T03:05:00.380Z",
        updated_at: "2015-02-16T03:05:00.392Z"
        }
    }]
```

**get /users/:user_id/houses/:house_id/messages/:id**<br>
Returns single message object<br>
```
    {
    id: 1,
    user_id: 1,
    house_id: 1,
    content: "clean shit up",
    created_at: "2015-02-16T03:05:00.332Z",
    updated_at: "2015-02-16T03:05:00.332Z"
    }
```

## Payments

**get /users/:user_id/houses/:house_id/payments**<br>
returns an array of all payments **for the current user**, sent or received
```
    [{
    id: 1,
    receiver_id: 11,
    payer_id: 7,
    amount: 1,
    house_id: 1,
    description: "rent for dbc",
    fulfilled: true,
    created_at: "2015-02-16T03:05:21.810Z",
    updated_at: "2015-02-16T03:05:21.810Z"
    },
    {
    id: 2,
    receiver_id: 7,
    payer_id: 7,
    amount: 5,
    house_id: 1,
    description: "requesting payment for food bills",
    fulfilled: false,
    created_at: "2015-02-16T03:05:21.816Z",
    updated_at: "2015-02-16T03:05:21.816Z"
    }]
```

**get /users/:user_id/houses/:house_id/payments/:id** <br>
Returns a single payment object
```
    {
    id: 1,
    receiver_id: 11,
    payer_id: 7,
    amount: 1,
    house_id: 1,
    description: "rent for dbc",
    fulfilled: true,
    created_at: "2015-02-16T03:05:21.810Z",
    updated_at: "2015-02-16T03:05:21.810Z"
    }
```

