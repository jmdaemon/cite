{-# LANGUAGE OverloadedStrings #-}
module Main where

import Lib
import System.Environment
import System.Exit
import Network.Wreq
import Control.Lens

--main = getArgs >>= parse >>= putStr . cite
--main = getArgs >>= parse >>= cite
--main = getArgs >>= parse

--main = getArgs >>= cite . parse

--main = getArgs >>= parse >>= cite
main = do 
    args <- getArgs
    print args

showResponse response = print (response ^. responseBody) 

--cite lines = unlines . reverse . lines
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

