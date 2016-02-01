{-# LANGUAGE DataKinds                  #-}
{-# LANGUAGE DeriveGeneric              #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE OverloadedStrings          #-}
{-# LANGUAGE TemplateHaskell            #-}
{-# LANGUAGE TypeOperators              #-}

module Model.V1.FlockerVolumeSource
    ( FlockerVolumeSource (..)
    ) where

import Control.Lens.TH (makeLenses)
import Data.Aeson
import Data.Text (Text)
import GHC.Generics
import Test.QuickCheck
import Test.QuickCheck.Instances ()


data FlockerVolumeSource = FlockerVolumeSource
    { _datasetName :: Text
    } deriving (Show, Eq, Generic)
makeLenses ''FlockerVolumeSource

instance FromJSON FlockerVolumeSource
instance ToJSON FlockerVolumeSource
instance Arbitrary FlockerVolumeSource where
    arbitrary = FlockerVolumeSource <$> arbitrary
