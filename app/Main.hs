{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE DeriveGeneric     #-}

module Main where

import Lib
import System.Environment
import System.Exit
--import Network.Wreq

--import Control.Lens
--import Control.Monad.IO.Class
--import Data.Aeson
--import Network.HTTP.Req

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
    --args <- getArgs
        --let url = take 1 args
    --let url = take 1 <- getArgs
    --args <- getArgs
    --let url = DataT.pack $ Prelude.head $ Prelude.take 1 args
    --let url = DataT.fromString $ Prelude.head $ Prelude.take 1 args
    let url = DataT.pack $ Prelude.head $ Prelude.take 1 args
    --r <-
    bs <-
        req
            GET
            (https url)
            --url
            NoReqBody
            bsResponse
            mempty
    liftIO $ B.putStrLn (responseBody bs)
    --liftIO $ print (responseBody r :: Value)

--main = getArgs >>= parse >>= putStr . cite
--main = getArgs >>= parse >>= cite
--main = getArgs >>= parse

--main = getArgs >>= cite . parse

--main = getArgs >>= parse >>= cite



--showResponseBody response = print (response ^. responseBody)
----showResponseBody response = print (response ^. responseHeader "Content-Type")

--main = do 
    --args <- getArgs
    --fmap  (mapM $ showResponseBody) (mapM get args)



    --fmap (mapM showResponseBody) (mapM get args)
    --mapM print args
    --fmap print (mapM get args)

--showResponse response = print (response ^. responseBody) 

--cite lin(es = unlines . reverse . lines
--cite responses = fmap . print (response ^. responseBody)
--cite responses = map ($ showResponse) responses 
--cite urls = map ($ showResponse) (map (get) urls)
--cite urls = map ($ showResponse) (map get urls)

-- Parse the command line arguments

--parse ["-h"] = usage   >> exit
--parse ["-v"] = version >> exit
--parse []     = getContents

--parse urls   = concat `fmap` mapM readFile fs
--parse urls   = concat `fmap` mapM getArgs urls
--parse urls   = fmap mapM getArgs urls
--parse urls   = fmap mapM getArgs urls
--parse urls   = fmap mapM get urls
--parse urls  = mapM mapM get urls
--parse urls  = fmap get urls
--parse urls  = fmap putStrLn urls
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

