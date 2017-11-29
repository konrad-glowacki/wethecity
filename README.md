# We The City
A platform to connect project leaders with volunteers to accelerate social projects

## What are app requirements?
Database *Postgres* (< 9.6.6)  
https://www.postgresql.org/

Ruby Version Manager  
https://rvm.io/

MiniMagick  
http://mini_magick.rubyforge.org/

---

## How to install app?
```
rvm install ruby-2.4.2
rvm gemset create wethecity
gem install bundler
bundle install
cp .env.example .env
rake db:create
rake db:migrate
rake db:load_sample_data
```

---

## How to run app?
`rails server`
