// Using the TechProducts database
use TechProductsDB
switched to db TechProductsDB

// Clear existing collections
db.Devices.drop()
true
db.Accessories.drop()
true

// Create and populate Devices collection
db.Devices.insertMany([
    { 
        "_id": 101, 
        "model": "GalaxyPhone", 
        "price": 799, 
        "launchDate": ISODate("2021-05-14"), 
        "specifications": { 
            "memory": 8, 
            "display": 6.7, 
            "processor": 2.8 
        },
        "colorOptions": ["midnight", "silver"],
        "storage": [128, 256, 512]
    },
    {
        "_id": 102,
        "model": "GalaxyTab",
        "price": 899,
        "launchDate": ISODate("2021-09-01"),
        "specifications": {
            "memory": 12,
            "display": 10.4,
            "processor": 3.2
        },
        "colorOptions": ["gray", "silver", "blue"],
        "storage": [256, 512]
    }
])
{
    acknowledged: true,
    insertedIds: { '0': 101, '1': 102 }
}

// Query examples with modern syntax
// 1. Find devices with exact price match
db.Devices.find(
    { price: { $eq: 899 } },
    { model: 1, price: 1, _id: 0 }
)
{ "model": "GalaxyTab", "price": 899 }

// 2. Find devices with specific memory configuration
db.Devices.find(
    { "specifications.memory": { $gte: 8 } },
    { model: 1, "specifications.memory": 1 }
)
{
    "_id": 101,
    "model": "GalaxyPhone",
    "specifications": { "memory": 8 }
}
{
    "_id": 102,
    "model": "GalaxyTab",
    "specifications": { "memory": 12 }
}

// 3. Find devices available in specific colors
db.Devices.find(
    { colorOptions: { $in: ["blue", "silver"] } },
    { model: 1, colorOptions: 1 }
)
{
    "_id": 101,
    "model": "GalaxyPhone",
    "colorOptions": ["midnight", "silver"]
}
{
    "_id": 102,
    "model": "GalaxyTab",
    "colorOptions": ["gray", "silver", "blue"]
}

// 4. Find devices launched in 2021
db.Devices.find(
    { 
        launchDate: { 
            $gte: ISODate("2021-01-01"),
            $lt: ISODate("2022-01-01")
        }
    },
    { model: 1, launchDate: 1 }
)
{
    "_id": 101,
    "model": "GalaxyPhone",
    "launchDate": ISODate("2021-05-14T00:00:00Z")
}
{
    "_id": 102,
    "model": "GalaxyTab",
    "launchDate": ISODate("2021-09-01T00:00:00Z")
}

// 5. Find devices with specific storage options
db.Devices.find(
    { storage: { $all: [256, 512] } },
    { model: 1, storage: 1 }
)
{
    "_id": 101,
    "model": "GalaxyPhone",
    "storage": [128, 256, 512]
}
{
    "_id": 102,
    "model": "GalaxyTab",
    "storage": [256, 512]
}

// Create indexes for better performance
db.Devices.createIndex({ model: 1 })
{
    "createdCollectionAutomatically": false,
    "numIndexesBefore": 1,
    "numIndexesAfter": 2,
    "ok": 1
}

db.Devices.createIndex({ "specifications.memory": 1 })
{
    "createdCollectionAutomatically": false,
    "numIndexesBefore": 2,
    "numIndexesAfter": 3,
    "ok": 1
}
