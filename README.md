# Hto

Hto stands for 'Hash to object' and makes converting a Hash into an OpenStruct and access its data as trivial as eating a cereal bowl. 

## Disclaimer
- For now, this gem focuses on reading data, so it is currently not made for writing new or modifying any data from the HtoItem instances.
- As pointed out in this [article](http://blog.honeybadger.io/how-openstruct-and-hashes-can-kill-performance/), the use of OpenStruct can be slow when dealing when a huge amount of data. Since Hto focuses on providing a quick and easy way to access data, it is not (yet) optimised for such a case.

## Installation

To install the latest dev version

```ruby
gem 'hto', git: "git://github.com/gtroppee/hto.git"
```

## Use cases
There are basically 3 possibilities when working with this gem, based on the provided input:

**Hash**

Returns an instance of HtoItem, with all its peculiarities (see below)

**Array of hashes**

Returns an instance of HtoCollection (basically an array of HtoItem instances)

**Anything else**

Returns the input as is

## How it works
To start using the gem, just proceed like so:

* **Setup with a hash** 
```ruby
hash = { a: 1, b: { c: 3 } }
hto_item = Hto.collect(hash) #=> #<HtoItem ...>
```

* **Setup with an array of hashes**
```ruby
array = [
  { a: 1, b: { c: 3 } },
  { d: 4, e: { f: 6 } }
]
hto_collection = Hto.collect(array) #=> #<HtoCollection ...>
```

* **Accessing data from an HtoItem instance**
You can basically access your data via message passing or key lookup (string and symbol) or via a mix of those, meaning you can do as follows:
```ruby
hto_item.a     #=> 1
hto_item['a']  #=> 1
hto_item[:a]   #=> 1
hto_item.b     #=> { :c => 3 }
hto_item['b']  #=> { :c => 3 }
hto_item[:b]   #=> { :c => 3 }
hto_item['b'].c  #=> 3
hto_item.b[:c]   #=> 3
...
```
You can also revert any HtoItem instance back to the original hash:
```ruby
hash = { a: 1, b: { c: 3 } }
hto_item = Hto.collect(hash) #=> #<HtoItem ...>
hto_item.to_h #=> { :a => 1, :b => { :c => 3 } }
hto_item.to_hash #=> { :a => 1, :b => { :c => 3 } }
```

## Contribution
Contributions are more than welcome, but please make sure to add relevant unit tests and pass them all before submitting any code.

