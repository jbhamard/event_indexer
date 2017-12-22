{-# LANGUAGE DeriveGeneric, DeriveAnyClass #-}

module Main where

import System.Environment

import GHC.Generics
import Data.Aeson
import qualified Data.ByteString.Lazy as B

-- read the json file

jsonFile :: FilePath
jsonFile = "./events/test.json"
-- jsonFile = "./events/event_0.json"

jsonString :: IO B.ByteString
jsonString = B.readFile jsonFile

-- Columbo events types

-- data Producer = Producer {
--   uid     :: String,
--   label   :: String,
--   type    :: String }
--   deriving (Generic, ToJSON, FromJSON)

-- data Resource = Resource {
--   uid     :: String,
--   label   :: String,
--   type    :: String,
--   attributes :: String }
--   deriving (Generic, ToJSON, FromJSON)

-- data ColumboEvent = ColumboEvent {
--   system :: Producer,
--   actor  :: Producer,
--   resource ::  Resource,
--   related_resources :: String,
--   timestamp :: String,
--   action ::String,
--   uuid ::String }
--   deriving (Generic, ToJSON, FromJSON)

data System = System {
  uid         :: String,
  label       :: String,
  attributes  :: Object}
  deriving (Generic, ToJSON, FromJSON, Show)

systemLabel :: Maybe System -> String
systemLabel (Just s) = label s
systemLabel (Nothing) = "nothing"

main :: IO ()
main = do
  json <- jsonString
  let s = decode json
  putStrLn $ systemLabel s
  -- jsonString >>= decode >>= systemLabel



