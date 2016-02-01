{-# LANGUAGE DataKinds                  #-}
{-# LANGUAGE DeriveGeneric              #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE OverloadedStrings          #-}
{-# LANGUAGE TemplateHaskell            #-}
{-# LANGUAGE TypeOperators              #-}

module Model.V1.ResourceQuotaStatus
    ( ResourceQuotaStatus (..)
    ) where

import Control.Lens.TH (makeLenses)
import Data.Aeson
import Data.Text (Text)
import GHC.Generics
import Test.QuickCheck
import Test.QuickCheck.Instances ()
import Model.V1.Any


data ResourceQuotaStatus = ResourceQuotaStatus
    { _hard :: Value
    , _used :: Value
    } deriving (Show, Eq, Generic)
makeLenses ''ResourceQuotaStatus

instance FromJSON ResourceQuotaStatus
instance ToJSON ResourceQuotaStatus
instance Arbitrary ResourceQuotaStatus where
    arbitrary = ResourceQuotaStatus <$> arbitrary <*> arbitrary
