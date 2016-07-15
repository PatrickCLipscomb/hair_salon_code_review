# _Hair Salon_

### _15 July 2016_

#### By Patrick Lipscomb

## Description
_Hair Salon_ is a app that lets a salon owner create a client list associated with a specific stylist in the salon. The salon owner can edit both the client and stylist lists and add and remove items from both lists, including the associations between the clients to the stylists.

## Goal
Reflect an introduction to Ruby, Sinatra, BDD, SQL (Postgres), database relationships, custom classes and routing.

### Technologies Used
- html
- javascript
- css
- ruby
- sinatra
- capybara, rspec
- SQL

### Database Schema:

```sql
CREATE DATABASE hair_salon;
CREATE TABLE clients (id SERIAL PRIMARY KEY, name VARCHAR, stylist_id INT);
CREATE TABLE stylists (id SERIAL PRIMARY KEY, name VARCHAR);
CREATE DATABASE hair_salon_test WITH TEMPLATE hair_salon;
```
### License
#### The MIT License (MIT)
Copyright (c) 2016 Patrick Lipscomb

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
