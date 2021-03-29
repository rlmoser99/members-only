# Members-Only
This project is from [The Odin Project](https://www.theodinproject.com/paths/full-stack-ruby-on-rails/courses/ruby-on-rails/lessons/authentication).

## Project Planning:
Inside the clubhouse, members can see who the author of a post is but, outside, they can only see the story and wonder who wrote it.

### Users:
username:string     [ Validations: unique, present ] 
email:string        [ Validations: unique, present ] 
password:string     [ Validations: unique, present ] 
member:boolean      [ Validations: unique, present ] 
id:integer
created_at:datetime
updated_at:datetime

Association -> has_many posts

### Post:
content:text        [ Validations: present ] 
user_id:integer     (foreign id)
id:integer
created_at:datetime
updated_at:datetime

Association -> has_one user
