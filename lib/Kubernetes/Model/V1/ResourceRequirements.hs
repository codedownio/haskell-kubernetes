-- Copyright (c) 2016-present, SoundCloud Ltd.
-- All rights reserved.
--
-- This source code is distributed under the terms of a MIT license,
-- found in the LICENSE file.

{-# LANGUAGE DeriveGeneric              #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE TemplateHaskell            #-}

module Kubernetes.Model.V1.ResourceRequirements
    ( ResourceRequirements (..)
    , limits
    , requests
    , mkResourceRequirements
    ) where

import           Control.Lens.TH           (makeLenses)
import           Data.Aeson.TH             (defaultOptions, deriveJSON,
                                            fieldLabelModifier)
import           GHC.Generics              (Generic)
import           Kubernetes.Model.V1.Any   (Any)
import           Prelude                   hiding (drop, error, max, min)
import qualified Prelude                   as P
import           Test.QuickCheck           (Arbitrary, arbitrary)
import           Test.QuickCheck.Instances ()

-- | ResourceRequirements describes the compute resource requirements.
data ResourceRequirements = ResourceRequirements
    { _limits   :: !(Maybe Any)
    , _requests :: !(Maybe Any)
    } deriving (Show, Eq, Generic)

makeLenses ''ResourceRequirements

$(deriveJSON defaultOptions{fieldLabelModifier = (\n -> if n == "_type_" then "type" else P.drop 1 n)} ''ResourceRequirements)

instance Arbitrary ResourceRequirements where
    arbitrary = ResourceRequirements <$> arbitrary <*> arbitrary

-- | Use this method to build a ResourceRequirements
mkResourceRequirements :: ResourceRequirements
mkResourceRequirements = ResourceRequirements Nothing Nothing
