#!/usr/bin/ruby1.8
# -*- coding: utf-8 -*-
=begin

  $Lastupdate: 2013/06/26 19:41:52$
  Youhei SASAKI <uwabami@gfd-dennou.org>

= これは何?

RSS をパースして, javascript として出力するモノです.
RSS parser の習作として作成しました.

= usage

…ごめん本体読んで.

=end

require 'open-uri'
require 'rss/1.0'
require 'uri'
require 'pp'
require 'cgi'

def items_to_js(rss)
  title = rss.channel.title
  url = rss.channel.link.sub("https", "http")
  puts "document.writeln('<h3><a href=\"#{url}\">平衡点</a>(blog): Recent entries</h3><ul>')"
  i = 0
  while i < 10
    # 頭の悪い置換
    rtitle = URI.decode(URI.encode(rss.item(i).title).gsub(/\[.*\]/,"")).gsub(/^\s*/," ").gsub(/'/,"")
    link = rss.item(i).link.sub("https","http")
    puts "document.writeln('<li class=\"RSSitems\"><a href=\"#{link}\">#{rtitle}</a></li>')"
    i += 1
  end
  puts "document.writeln('</ul>')"
end

rss_src = open("http://uwabami.junkhub.org/log/no_comments.rdf").read
rss = RSS::Parser.parse(rss_src, false)

if rss.nil?
  puts "#{fname} は RSS 0.9x/1.0/2.0 のいずれでもありません"
else
  items_to_js(rss)
end
