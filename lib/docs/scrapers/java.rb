module Docs
  class Java < UrlScraper
    self.name = 'Java'
    self.type = 'java'
    self.root_path = 'overview-summary.html'
    self.links = {
      home: 'http://docs.oracle.com/javase/8'
    }
    self.release = '8'
    self.base_url = 'http://docs.oracle.com/javase/8/docs/api/'

    html_filters.push 'java/entries', 'java/clean_html'

    options[:skip_patterns] = [
      /package-tree.html/,
      /package-use.html/,
      /deprecated-list.html/,
      /class-use\//,
      /doc-files\//,
      /\Ajava\/applet/,
      /\Ajavax\/swing/,
      /\Aorg\/omg/,      
      /\Aorg\/ietf/,
      /\Ajavax\/sound/
      ]

    options[:attribution] = <<-HTML
      &copy; 1993&ndash;2016, Oracle and/or its affiliates.
    HTML
  end
end
