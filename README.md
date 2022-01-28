# RoR Blog App

> A blog app made on ruby on rails

## Built With

Ruby >= 3.0.0

Rails >= 7.0.0

Postgresql >= 12.0

## Getting Started

**The project comes shipped with linters config for ruby on rails, so ensure you have Rubocop and npm installed**

- To get a local copy of the repository please run the following commands on your terminal:
- $ git clone https://github.com/mike2611/blog-app.git
- $ cd blog-app
- $ run `bundle install` to couple all dependencies
- Install the `postgresql` database system and all necessary dependencies
- Run `rails db:create` to create the database locally or if already have one run `rails db:reset` instead
- After installing everything, you can run now the website with `rails s`

<details>
<summary>Quick guide how to test the API</summary>
Sign-up:

```
curl -XPOST -H "Content-Type: application/json" -d '{ "user": { "name": "John", "photo": "https://i.pravatar.cc/200?img=3", "bio": "some bio", "posts_counter": "0", "email": "test@example.com", "password": "12345678" } }' http://localhost:3000/users
```
Click the link in the terminal to confirm the registration:

```
curl -XPOST -i -H "Content-Type: application/json" -d '{ "user": { "email": "test@example.com", "password": "12345678" } }' http://localhost:3000/users/sign_in
```
Replace the Authorization: Bearer `token` with {{{your token}}} for the next steps below:
Create a new post:

```
curl -XPOST -H "Authorization: Bearer {{{your_token}}}" -H "Content-Type: application/json" -d '{ "post": { "title": "New Post", "text": "This a post created from the API", "comments_counter": "0", "likes_counter": "0"} }' http://localhost:3000/api/posts
```
Get all the posts:

```
curl -XGET -H "Authorization: Bearer  {{{your_token}}}" -H "Content-Type: application/json" http://localhost:3000/api/posts
```
Add a comment:

```
curl -XPOST -H "Authorization: Bearer {{{your_token}}}" -H "Content-Type: application/json" -d '{ "comment": { "text": "new comment from API"} }' http://localhost:3000/api/posts/1/comments
```
Get all comments:

```
curl -XGET -H "Authorization: Bearer {{{your_token}}}" -H "Content-Type: application/json" http://localhost:3000/api/posts/1/comments
```
</details>


## Authors

👤 **Miguel Angel Puentes**
- GitHub: [@mike2611](https://github.com/mike2611)
- Twitter: [@MiguelP2611](https://twitter.com/MiguelP2611)
- LinkedIn: [Miguel Puentes Mata](https://linkedin.com/in/miguel-puentes-mata-90a562139/)

👤 **Luís Fernando**

- GitHub: [![@lfmnovaes](https://img.shields.io/github/followers/lfmnovaes?color=lightgray&style=plastic&labelColor=blue)](https://github.com/lfmnovaes)
- Twitter: [![@lfmnovaes](https://img.shields.io/twitter/follow/lfmnovaes?style=plastic&labelColor=blue)](https://www.twitter.com/lfmnovaes/)
- LinkedIn: [![@lfmnovaes](https://img.shields.io/badge/LinkedIn-blue?style=plastic&logo=linkedin)](https://www.linkedin.com/in/lfmnovaes/)

## 🤝 Contributing

Contributions, issues, and feature requests are welcome!

## Show your support

Give a ⭐️ if you like this project!

## 📝 License
- This project is [MIT](./LICENSE) licensed.
