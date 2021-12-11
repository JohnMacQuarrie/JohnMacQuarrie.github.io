# the idea is that this program will modify html documents that can be pushed to the site.  I'll make a text document 


oldpage = read("./contact/index.html", String)

menu = read("./englishheader.html", String)


r = findnext("<!--ENGPREAMBLE-->", oldpage, 1) 

if typeof(r) != Nothing
    s = last(r)
    t = first( findnext("<!--ENGPREAMBLE-->", oldpage, s) )
  #  series = series[1:s]*"{"*series[s+2:end]
  #   series = series[1:t-1]*"}"*series[t+1:end]
 end

newpage = oldpage[1:s]*menu*oldpage[t:end]

page = open("./contact/index.html", "w")

write(page, newpage)

close(page)