fh=open('m2actual.csv','r')
fw=open('m2saver.csv','w')
i=1
c=0
for lines in fh:
    lines=lines.replace('2019-0','')
    lines=lines.replace(' ','')
    lines=lines.replace('-','')
    line=list(lines)
    line[0]=''
    line[1]=''
    line[2]=''
    lines=''.join(line)
    #print("day:"+str(i)+"--")
    lines=str(i)+lines
    #print(lines)
    c=c+1
    if(c==48):
        c=0
        i=i+1
    fw.write(lines)
fw.close()
fh.close()


