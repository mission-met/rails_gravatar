rails_gravatar
=============

A simple gem for for generating Gravatar images and tags in a Rails environment.


Installation
-----------------

```shell
gem install rails_gravatar
```


Example Usage
-----------------

```ruby
require 'rails_gravatar'

# Generate only the image URL
RailsGravatar.src("me@email.com")
RailsGravatar.src("me@email.com", 32) # with size
RailsGravatar.src("me@email.com", 32, "http://email.com/image.png") # with fallback image url

# Generate the whole image tag
RailsGravatar.tag("me@email.com")
RailsGravatar.tag("me@email.com", 32) # with size
RailsGravatar.tag("me@email.com", 32, "http://email.com/image.png", "The image alt text") # with fallback image url
```


Using with Rails
-----------------

Because we are using the Rails tag helpers, you do not need to use tag helpers such as `raw` or `.html_safe`.

```ruby
<%= Gravatar.src("me@email.com") %>
```


Parameters
-----------------

```ruby
Gravatar.src(email_address, size, default_image_url)
```

```ruby
Gravatar.tag(email_address, size, default_image_url, alt_text)
```


DNS Prefetch
-----------------

You can also automatically add the DNS prefetch tag to your page headers using:

```
<%= Gravatar.prefetch_dns_tag %>
```


Testing
-----------------

`bundle exec rspec`


License
-----------------

Please see [LICENSE](https://github.com/mission-met/rails_gravatar/blob/master/LICENSE) for licensing details.


Author
-----------------

[https://github.com/mission-met](https://github.com/mission-met)
[https://github.com/rickychilcott](https://github.com/rickychilcott)