#for reference
#dictToInsert = {key[i]: value[i] for i in range(len(key))}

import pymongo
myclient = pymongo.MongoClient("mongodb://localhost:27017/")
db = myclient['hospitalDb']
col=db['patientCol']
while(True):
    print("*"*50,"\nChoose a operation(Default is Exit)\n","*"*50,"\n1.Create\n2.Retrieve\n3.Update\n4.Delete\nChoice:",end='',sep="")
    ch=int(input())
    if ch==1:
        print("Enter patient name, age and diagnosis:")
        value=input().split()
        log=col.insert_one({'name':value[0],'age':value[1],'diagnosis':value[2]})
        print("Data inserted for record with ObjectId:",log.inserted_id)
    elif ch==2:
        for i in col.find():
            print(i)
    elif ch==3:
        print("Enter key & value pair to identify the document:")
        key,value=input().split()
        filter_criteria = {key: value}
        print("Enter key  and new value to be changed:")
        key,value=input().split()
        setBlock={"$set":{key:value}}
        x = col.update_many(filter_criteria, setBlock)
    elif ch==4:
        print("Enter key & value pair to identify the document:")
        key,value=input().split()
        filter_criteria = { key: value }
        col.delete_many(filter_criteria)
    else:
        exit()
