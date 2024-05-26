URLS = {}
function CreateFE(k,v)
    URLS[k] = v
end
function GenerateURLS(x) --511
      CreateFE(x,"https://ebook.smp.org/webbooks_static/content/en/18681/OPS/page0"..x..".xhtml")
end
function PrintURLS()
  local y = 0
  repeat
    y=y+1
    GenerateURLS(y)
    print("\n"..URLS[y])
  until #URLS == 336
end

PrintURLS()
