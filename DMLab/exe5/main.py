import pymongo
import time
import json

myclient = pymongo.MongoClient("mongodb://localhost:27017/")
db = myclient['exefour']
colList = db.list_collection_names()

def execute_query(collection_name, query):
    # Select a collection
    #collection = db[collection_name]
    result = db.command(query)
    print(result)

    
def select_operation():

    print("*"*50,"\nChoose a operation(Default is Go back)\n","*"*50,"\n1.Create\n2.Retrieve\n3.Update\n4.Delete\nChoice:",end='',sep="")
    ch=int(input())
    if ch==1:
        return "create"
    if ch==2:
        return "retrieve"
    if ch==3:
        return "update"
    if ch==4:
        return "delete"
    elif ch==5:
        return 'query'
    elif ch==6:
        return 'aggregate'    
    elif ch==7:
        return 'custom'    

    else:
        return "goBack"
    
def perform_operation(operation,colName):
    collection=db[colName]
    if operation == "create":
        print("Enter keys of the document to be added")
        key=input().split()
        print("Enter resepective values:")
        value=input().split()
        dictToInsert = {key[i]: value[i] for i in range(len(key))}
        log=collection.insert_one(dictToInsert)
        print("Data inserted for record with ObjectId:",log.inserted_id)
    elif operation =="retrieve":
        for i in collection.find():
            print(i)
    elif operation =="update":
        print("Enter key & value pair to identify the document:")
        key,value=input().split()
        filter_criteria = {key: value}
        print("Enter keys of the value to be changed:")
        key=input().split()
        print("Enter new value for respective key:")
        value=input().split()
        dictToUpdate = {key[i]: value[i] for i in range(len(key))}
        setBlock={"$set":dictToUpdate}
        x = collection.update_many(filter_criteria, setBlock)


        
    elif operation =="delete":
        print("Enter key & value pair to identify the document:")
        key,value=input().split()
        filter_criteria = { key: value }
        collection.delete_many(filter_criteria)
    elif operation=='query':
        q='[ { "$group": { "_id": null, "maxExperience": { "$max": "$yoe" } } }, { "$unwind": "$maxExperience" }, { "$lookup": { "from": "doctor", "localField": "maxExperience", "foreignField": "yoe", "as": "doctorsWithMaxExperience" } }, { "$project": { "_id": 0, "doctorsWithMaxExperience": 1 } }]' 
        q=[{"$unwind":"$drug"},{"$group":{"_id":{"name":"$name","city":"$city"},"count":{"$sum":1}}},{"$match":{"count":{"$gte":2}}},{"$project":{"_id":0,"name":"$_id.name","city":"$_id.city"}}]

        result = collection.aggregate(q)
        for document in result:
            print(document)
    elif operation=='aggregate':
        part=input("Enter aggregate:")
        q=json.loads(part)
        result = collection.aggregate(q)
        for document in result:
            print(document)
    elif operation=='custom':
        collection_name = collection
        query_str = input("Enter the MongoDB query (in JSON format): ")
        try:
            query = eval(query_str)
        except Exception as e:
            print(f"Error parsing query: {e}")
        else:
            # Execute the query
            execute_query(collection_name, query)


        
while(True):
    print("="*30,"\nMENU(Default is Exit)\n","="*30,sep="")
    for _ in range(0,len(colList)):
        print(_+1,".",colList[_],sep="")
    print("\nSelect a Collection:",end='')
    try:ch=int(input())
    except:ch=0
    while ch>0 and ch<=len(colList):
        operation=select_operation()
        if operation !="goBack":
            perform_operation(operation,colList[ch-1])
        else:
            break
    else:
        if ch==len(colList)+1 :
            perform_operation("custom","dsadh")
            
        print("\nExiting ",end="")
        for _ in range(5):
            time.sleep(1)
            print(".",end="",flush=True)
        exit()