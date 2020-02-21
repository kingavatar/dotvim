autocmd FileType cpp call IoStream()
fu! IoStream()
    if line("$") == 1
        call append(0, "#include <iostream>")
        call append(1 ,"")
		call append(2,"using namespace std;")
		call append(3,"")
		call append(4, "int main()")
        call append(5,"{")
		call append(6,"")
		call append(7,"")
		call append(8,"")
		call append(9, "    return 0;")
        call append(10, "}")
    endif
endfu

