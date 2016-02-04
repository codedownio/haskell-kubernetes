-- Copyright (c) 2016-present, SoundCloud Ltd.
-- All rights reserved.
--
-- This source code is distributed under the terms of a MIT license,
-- found in the LICENSE file.

{-# LANGUAGE DeriveGeneric              #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE TemplateHaskell            #-}

module Kubernetes.Model.V1.ConfigMapKeySelector
    ( ConfigMapKeySelector (..)
    , name
    , key
    ) where

import           Control.Lens.TH (makeLenses)
import           Data.Aeson.TH (deriveJSON, defaultOptions, fieldLabelModifier)
import           Data.Text (Text)
import           GHC.Generics (Generic)
import           Prelude hiding (drop, error, max, min)
import qualified Prelude as P
import           Test.QuickCheck (Arbitrary, arbitrary)
import           Test.QuickCheck.Instances ()

-- | Selects a key from a ConfigMap.
data ConfigMapKeySelector = ConfigMapKeySelector
    { _name :: Maybe Text
    , _key :: Text
    } deriving (Show, Eq, Generic)

makeLenses ''ConfigMapKeySelector

$(deriveJSON defaultOptions{fieldLabelModifier = P.drop 1} ''ConfigMapKeySelector)

instance Arbitrary ConfigMapKeySelector where
    arbitrary = ConfigMapKeySelector <$> arbitrary <*> arbitrary
