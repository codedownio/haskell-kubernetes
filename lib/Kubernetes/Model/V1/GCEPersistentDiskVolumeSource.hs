-- Copyright (c) 2016-present, SoundCloud Ltd.
-- All rights reserved.
--
-- This source code is distributed under the terms of a BSD license,
-- found in the LICENSE file.

{-# LANGUAGE DeriveGeneric              #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE TemplateHaskell            #-}

module Kubernetes.Model.V1.GCEPersistentDiskVolumeSource
    ( GCEPersistentDiskVolumeSource (..)
    , pdName
    , fsType
    , partition
    , readOnly
    ) where

import           Control.Lens.TH (makeLenses)
import           Data.Aeson.TH (deriveJSON, defaultOptions, fieldLabelModifier)
import           Data.Text (Text)
import           GHC.Generics (Generic)
import           Prelude hiding (drop, error, max, min)
import qualified Prelude as P
import           Test.QuickCheck (Arbitrary, arbitrary)
import           Test.QuickCheck.Instances ()

-- | Represents a Persistent Disk resource in Google Compute Engine.\n\nA GCE PD must exist and be formatted before mounting to a container. The disk must also be in the same GCE project and zone as the kubelet. A GCE PD can only be mounted as read/write once. GCE PDs support ownership management and SELinux relabeling.
data GCEPersistentDiskVolumeSource = GCEPersistentDiskVolumeSource
    { _pdName :: Text
    , _fsType :: Text
    , _partition :: Maybe Integer
    , _readOnly :: Maybe Bool
    } deriving (Show, Eq, Generic)

makeLenses ''GCEPersistentDiskVolumeSource

$(deriveJSON defaultOptions{fieldLabelModifier = P.drop 1} ''GCEPersistentDiskVolumeSource)

instance Arbitrary GCEPersistentDiskVolumeSource where
    arbitrary = GCEPersistentDiskVolumeSource <$> arbitrary <*> arbitrary <*> arbitrary <*> arbitrary