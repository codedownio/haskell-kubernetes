-- Copyright (c) 2016-present, SoundCloud Ltd.
-- All rights reserved.
--
-- This source code is distributed under the terms of a BSD license,
-- found in the LICENSE file.

{-# LANGUAGE DeriveGeneric              #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE TemplateHaskell            #-}

module Kubernetes.Model.V1.Service
    ( Service (..)
    , kind
    , apiVersion
    , metadata
    , spec
    , status
    ) where

import           Control.Lens.TH (makeLenses)
import           Data.Aeson.TH (deriveJSON, defaultOptions, fieldLabelModifier)
import           Data.Text (Text)
import           GHC.Generics (Generic)
import           Prelude hiding (drop, error, max, min)
import qualified Prelude as P
import           Test.QuickCheck (Arbitrary, arbitrary)
import           Test.QuickCheck.Instances ()
import           Kubernetes.Model.V1.ObjectMeta (ObjectMeta)
import           Kubernetes.Model.V1.ServiceSpec (ServiceSpec)
import           Kubernetes.Model.V1.ServiceStatus (ServiceStatus)

-- | Service is a named abstraction of software service (for example, mysql) consisting of local port (for example 3306) that the proxy listens on, and the selector that determines which pods will answer requests sent through the proxy.
data Service = Service
    { _kind :: Maybe Text
    , _apiVersion :: Maybe Text
    , _metadata :: Maybe ObjectMeta
    , _spec :: Maybe ServiceSpec
    , _status :: Maybe ServiceStatus
    } deriving (Show, Eq, Generic)

makeLenses ''Service

$(deriveJSON defaultOptions{fieldLabelModifier = P.drop 1} ''Service)

instance Arbitrary Service where
    arbitrary = Service <$> arbitrary <*> arbitrary <*> arbitrary <*> arbitrary <*> arbitrary
