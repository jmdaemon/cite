{-# LANGUAGE OverloadedStrings #-}

module Main where

import Lib
import System.Environment
import System.Exit
import Network.Wreq
import Control.Lens
import Data.ByteString.Lazy.Char8 as BS

-- | Show the html response body
showHTMLResponse respBody = Prelude.putStr $ BS.unpack $ respBody

main :: IO ()
main =
    do
        args <- getArgs
        let url = Prelude.head $ Prelude.take 1 args
        response <- get url
        showHTMLResponse $ response ^. responseBody

-- Parse the command line arguments

-- Parse the command line flags
parse ["-h"] = usage   >> exit
parse ["-v"] = version >> exit
parse []  = Prelude.getContents

usage   = Prelude.putStrLn "Usage: cite [-vh] [urls]"
version = Prelude.putStrLn "Haskell cite 0.1.0"
exit    = System.Exit.exitWith ExitSuccess
die     = System.Exit.exitWith (ExitFailure 1)
