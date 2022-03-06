# lc
Line Counter: Find ASCII files and get their line count

# About
This tool combines find,file and wc commands to get the line count of only ASCII files. I know that this can be done with oneliners
but i wanted something easy to remember and to use with other projects

# Examples

List all text files of current directory recursivelly and their line count
```
lc
/home/kpatronas/work/router/input/a_01102001.csv 190
/home/kpatronas/work/router/input/a_29072001.csv 225
/home/kpatronas/work/router/input/a_17092001.csv 677
/home/kpatronas/work/router/input/a_14062101.csv 8
/home/kpatronas/work/router/input/a_21062104.csv 51
/home/kpatronas/work/router/input/a_17032001.csv 5000
/home/kpatronas/work/router/input/b_17032001.csv 5000
```

List all text files of current directory recursivelly and their line count where their filename starts with b_
```
lc -p "b_*"
/home/kpatronas/work/router/input/b_17032001.csv 5000
```

List all text files of current directory recursivelly and their line count where their filename starts with b_ and the source directory is /home/kpatronas
```
lc -p "b_*" -w /home/kpatronas
/home/kpatronas/b_17032001.csv 5000
/home/kpatronas/work/router/input/b_17032001.csv 5000
.
.
```

List all text files of current directory recursivelly and their line count where their filename starts with b_ and the source directory is /home/kpatronas but dont go recursive
```
lc -p "b_*" -w /home/kpatronas -r 1
/home/kpatronas/b_17032001.csv 5000
```
