json.sizes @sizes do |size|
  json.partial! "item", size: size
end