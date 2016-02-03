-- Copyright (c) 2016-present, SoundCloud Ltd.
-- All rights reserved.
--
-- This source code is distributed under the terms of a BSD license,
-- found in the LICENSE file.

{-# LANGUAGE DeriveGeneric              #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE TemplateHaskell            #-}

module Kubernetes.Model.V1.SecurityContext
    ( SecurityContext (..)
    , capabilities
    , privileged
    , seLinuxOptions
    , runAsUser
    , runAsNonRoot
    ) where

import           Control.Lens.TH (makeLenses)
import           Data.Aeson.TH (deriveJSON, defaultOptions, fieldLabelModifier)
import           GHC.Generics (Generic)
import           Prelude hiding (drop, error, max, min)
import qualified Prelude as P
import           Test.QuickCheck (Arbitrary, arbitrary)
import           Test.QuickCheck.Instances ()
import           Kubernetes.Model.V1.Capabilities (Capabilities)
import           Kubernetes.Model.V1.SELinuxOptions (SELinuxOptions)

-- | SecurityContext holds security configuration that will be applied to a container. Some fields are present in both SecurityContext and PodSecurityContext.  When both are set, the values in SecurityContext take precedence.
data SecurityContext = SecurityContext
    { _capabilities :: Maybe Capabilities
    , _privileged :: Maybe Bool
    , _seLinuxOptions :: Maybe SELinuxOptions
    , _runAsUser :: Maybe Integer
    , _runAsNonRoot :: Maybe Bool
    } deriving (Show, Eq, Generic)

makeLenses ''SecurityContext

$(deriveJSON defaultOptions{fieldLabelModifier = P.drop 1} ''SecurityContext)

instance Arbitrary SecurityContext where
    arbitrary = SecurityContext <$> arbitrary <*> arbitrary <*> arbitrary <*> arbitrary <*> arbitrary