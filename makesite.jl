# the idea is that this program will modify html documents that can be pushed to the site.  I'll make a text document 


pages = [
    "./index.html", 
    "./research/index.html",
    "./students/index.html",
    "./teaching/index.html",
    "./contact/index.html",
    "./links/index.html",
    "./research/pt.html",
    "./students/pt.html",
    "./teaching/pt.html",
    "./contact/pt.html",
    "./links/pt.html",
    "./pt/index.html"
]



for currentpage in pages

    # UPDATES ENGLISH MENU:

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



    # UPDATES PORTUGUESE MENU:

    newpage = ""
    
    oldpage = read(currentpage, String)

    r = nothing

    r = findnext("<!--PORMENU-->", oldpage, 1) 

    if typeof(r) != Nothing
    
        s = last(r)
        t = first( findnext("<!--PORMENU-->", oldpage, s) )

        menu = read("./portuguesemenu.html", String)

        newpage = oldpage[1:s]*menu*oldpage[t:end]

    else
        newpage = oldpage
    end

    page = open(currentpage, "w")
    write(page, newpage)
    close(page)
end