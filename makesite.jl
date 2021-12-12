# the idea is that this program will modify html documents that can be pushed to the site.  I'll make a text document 


pages = [
    "./index.html", 
    "./contact/index.html",
    "./research/index.html"
]



for currentpage in pages

    newpage = ""
    
    oldpage = read(currentpage, String)

    r = nothing

    r = findnext("<!--ENGMENU-->", oldpage, 1) 

    if typeof(r) != Nothing
    
        s = last(r)
        t = first( findnext("<!--ENGMENU-->", oldpage, s) )

        menu = read("./englishmenu.html", String)

        newpage = oldpage[1:s]*menu*oldpage[t:end]

    else
        newpage = oldpage
    end

    page = open(currentpage, "w")
    write(page, newpage)
    close(page)
end