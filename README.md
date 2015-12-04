# Teleport - Take you to a top search result instantly

Teleport exposes an action which allows users to input a search term, and takes them immediately to the most relevant search result.

### Installation
- Edit your web template and add the project clone url. (https://meta.discourse.org/t/install-a-plugin/19157)
- Rebuild your web container so that the plugin installs.

You're done!

### Usage

In order to teleport, simply visit the route `/teleport/search?q=<your_query_here>`.
Teleport will automatically pull up the most relevant topic search result and redirect you there. :zap:

### Contributing

Pull requests welcome! To contribute:
- Fork it ( https://github.com/<your-github-username>/teleport/fork )
- Create your feature branch (`git checkout -b your-new-feature`)
- Commit your changes (`git commit -am 'Add some feature`)
- Push to the branch (`git push origin your-new-feature`)
- Create a new Pull Request
