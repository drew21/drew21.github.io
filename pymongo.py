import pymongo

#Common Files import
#dataset names taken from mongo db
import sys, os

sys.path.append(os.path.abspath(‘Files’)) #checks for folder within current directory
sys.path.append(os.path.abspath(os.path.join('..', ‘Files'))) #checks for folder one directory out
import ExcelExport

client = pymongo.MongoClient("Mongocompass adrress")
db = client["database name"]

storyTbl = db['datasetname']
qryTbl = db["datasetname2"]
TrgtTbl = db["datasetname3"]
NotFnd = db["NotFoundData"]
critical = db["Stg_Critical"]
datapull2 = db["Dates"]

sqry = qryTbl.find({"Status": "In Work"})
saqry = qryTbl.find({"Status": "Approved"}) #Stg
featsqry = TrgtTbl.find({"Status": "Approved"}) #Cycle
saqrynew = ([p["Num"] for p in qryTbl.find({"Status":"Approved"})])
featsqrynew = ([p["Num"] for p in TrgtTbl.find({"Status":"Approved"})])

for id in saqrynew:     #Aproved in Feature
        if id in featsqrynew: #Approved
            continue
        else:
            for a in saqry:
                look = "-"
                if a["Project"].find(look) == -1:
                    PI = a["Project"]
                else:
                    PI = a["Project"][0:(a["Project"].find(look) - 1)]
                
                #Checking to see if is already in the collection
                x = TrgtTbl.count_documents({"Status":"Approved","Num":a["Num"]})
                if x < 1:
                     TrgtTbl.update_one({"Num": a['Num']},
                                    {"$set":
                                    {"RunDt": a["RunDt"],
                                    "InWorkStartDt": date.today().strftime("%m/%d/%Y"),
                                    "Status": a["Status"],
                                    "Num": a["Num"],
                                    "Name": a["Name"],
                                    "PI": PI,
                                    "TeamName": a["TeamName"]]}}, upsert=True)