// Working with TechStore database
use TechStoreDB
switched to db TechStoreDB

// Create Electronics collection
db.createCollection("Electronics")
{ ok: 1 }

// Insert product records (corrected "spec" field name)
db.Electronics.insertMany([
  {
    "_id": 101,
    "productName": "GalaxyPhone",
    "price": 799,
    "releaseDate": ISODate("2011-05-14"),
    "specs": {
      "ram": 4,
      "screenSize": 6.5,
      "cpu": 2.66
    },
    "colors": ["white", "black"],
    "storageOptions": [64, 128, 256]
  },
  {
    "_id": 102,
    "productName": "GalaxyTab",
    "price": 899,
    "releaseDate": ISODate("2011-09-01"),
    "specs": {
      "ram": 16,
      "screenSize": 9.5,
      "cpu": 2.66
    },
    "colors": ["white", "black", "purple"],
    "storageOptions": [128, 256, 512]
  }
])
{
  acknowledged: true,
  insertedIds: { '0': 101, '1': 102 }
}

// View all electronics products
db.Electronics.find().pretty()
{
  "_id": 101,
  "productName": "GalaxyPhone",
  "price": 799,
  "releaseDate": ISODate("2011-05-14T00:00:00Z"),
  "specs": {
    "ram": 4,
    "screenSize": 6.5,
    "cpu": 2.66
  },
  "colors": ["white", "black"],
  "storageOptions": [64, 128, 256]
}
{
  "_id": 102,
  "productName": "GalaxyTab",
  "price": 899,
  "releaseDate": ISODate("2011-09-01T00:00:00Z"),
  "specs": {
    "ram": 16,
    "screenSize": 9.5,
    "cpu": 2.66
  },
  "colors": ["white", "black", "purple"],
  "storageOptions": [128, 256, 512]
}

// Create TechBooks collection
db.createCollection("TechBooks")
{ ok: 1 }

// Insert book records with corrected structure
db.TechBooks.insertMany([
  {
    "_id": 201,
    "title": "Modern Android Development",
    "isbn": "9781933988673",
    "categories": ["Mobile", "Programming"],
    "available": true
  },
  {
    "_id": 202,
    "title": "JavaScript Frameworks Guide",
    "isbn": "9781935182722",
    "categories": ["Web Development"],
    "available": true
  }
])
{
  acknowledged: true,
  insertedIds: { '0': 201, '1': 202 }
}

// Find available books
db.TechBooks.find({ available: true }).pretty()
{
  "_id": 201,
  "title": "Modern Android Development",
  "isbn": "9781933988673",
  "categories": ["Mobile", "Programming"],
  "available": true
}
{
  "_id": 202,
  "title": "JavaScript Frameworks Guide",
  "isbn": "9781935182722",
  "categories": ["Web Development"],
  "available": true
}

// Projection examples
db.Electronics.findOne(
  { "_id": 101 },
  { "productName": 1, "price": 1, "specs.screenSize": 1 }
)
{
  "_id": 101,
  "productName": "GalaxyPhone",
  "price": 799,
  "specs": {
    "screenSize": 6.5
  }
}

// Cleanup collections
db.Electronics.drop()
true
db.TechBooks.drop()
true
