## COMPLETE THESE STEPS TO SET UP YOUR NEW APP

1. Update the Vagrantfile
2. Update /config/database.yml
3. If using Google oAuth for users, configure the app at `console.developers.google.com` and
   get the `client_id` and `client_secret` and replace in `/config/secrets.yml`
4. Configure production secrets with `bin/rails secrets:setup` and move production secrets there
5. `vagrant up`
6. Start building your new app.