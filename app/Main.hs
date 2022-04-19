{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE DeriveGeneric     #-}

module Main where

import Lib
import System.Environment
import System.Exit

import Control.Monad
import Control.Monad.IO.Class
import Data.Aeson
import Data.Maybe (fromJust)
import Data.Monoid ((<>))
import Data.Text (Text)
import Data.Text as DataT
import GHC.Generics
import Network.HTTP.Req
import qualified Data.ByteString.Char8 as B
import qualified Text.URI as URI

main :: IO ()
main = runReq defaultHttpConfig $ do
    args <- liftIO getArgs 
    let url = DataT.pack $ Prelude.head $ Prelude.take 1 args
    bs <-
        req
            GET
            (https url)
            --url
            NoReqBody
            bsResponse
            mempty
    liftIO $ B.putStrLn (responseBody bs)
-- Parse the command line arguments
--parse ["-h"] = usage   >> exit
--parse ["-v"] = version >> exit
--parse []     = getContents
parse urls  = urls

usage   = putStrLn "Usage: cite [-vh] [urls]"
version = putStrLn "Haskell cite 0.1.0"
exit    = exitWith ExitSuccess
die     = exitWith (ExitFailure 1)

--main :: IO ()
--main =
    --do
        --args <- getArgs
        --url = take 1 args
        --response <- get url
        --response <- get take 1 args
        --print (response ^. responseBody)


        --let url = take 1 args
         --in do
             --response <- get url
             --print (response ^. responseBody)

