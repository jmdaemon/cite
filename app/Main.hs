{-# LANGUAGE OverloadedStrings #-}

module Main where

import Lib
import System.Environment
import System.Exit
import Network.Wreq
import Control.Lens
import Data.ByteString.Lazy.Char8 as BS

main :: IO ()
main =
    do
        args <- getArgs
        let url = Prelude.head $ Prelude.take 1 args
        response <- get url
        Prelude.putStr $ BS.unpack $ response ^. responseBody

-- Parse the command line arguments
--parse ["-h"] = usage   >> exit
--parse ["-v"] = version >> exit
--parse []  = getContents

--usage   = putStrLn "Usage: cite [-vh] [urls]"
--version = putStrLn "Haskell cite 0.1.0"
--exit    = exitWith ExitSuccess
--die     = exitWith (ExitFailure 1)
