This is a Library application.

You can:
- borrow books as a user,
- edit and destroy books as an admin,
- check borrowing history

Gems used: faker, bootstrap-sass, omniauth-google-oauth2, paperclip

Important. After first login via google set admin role for user in console:

rails c
u = User.first
u.admin = true
u.save
