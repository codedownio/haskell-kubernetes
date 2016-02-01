{-# LANGUAGE DataKinds #-}
{-# LANGUAGE TypeFamilies #-}
{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE TypeOperators #-}
{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE OverloadedStrings #-}

module Api.ApivApi (
      getAPIResources
    , listNamespacedComponentStatus
    , readNamespacedComponentStatus
    , listConfigMap
    , listEndpoints
    , listEvent
    , listLimitRange
    , listNamespacedNamespace
    , createNamespacedNamespace
    , deletecollectionNamespacedNamespace
    , createNamespacedBinding
    , listNamespacedConfigMap
    , createNamespacedConfigMap
    , deletecollectionNamespacedConfigMap
    , readNamespacedConfigMap
    , replaceNamespacedConfigMap
    , deleteNamespacedConfigMap
    , patchNamespacedConfigMap
    , listNamespacedEndpoints
    , createNamespacedEndpoints
    , deletecollectionNamespacedEndpoints
    , readNamespacedEndpoints
    , replaceNamespacedEndpoints
    , deleteNamespacedEndpoints
    , patchNamespacedEndpoints
    , listNamespacedEvent
    , createNamespacedEvent
    , deletecollectionNamespacedEvent
    , readNamespacedEvent
    , replaceNamespacedEvent
    , deleteNamespacedEvent
    , patchNamespacedEvent
    , listNamespacedLimitRange
    , createNamespacedLimitRange
    , deletecollectionNamespacedLimitRange
    , readNamespacedLimitRange
    , replaceNamespacedLimitRange
    , deleteNamespacedLimitRange
    , patchNamespacedLimitRange
    , listNamespacedPersistentVolumeClaim
    , createNamespacedPersistentVolumeClaim
    , deletecollectionNamespacedPersistentVolumeClaim
    , readNamespacedPersistentVolumeClaim
    , replaceNamespacedPersistentVolumeClaim
    , deleteNamespacedPersistentVolumeClaim
    , patchNamespacedPersistentVolumeClaim
    , replaceNamespacedPersistentVolumeClaimStatus
    , listNamespacedPod
    , createNamespacedPod
    , deletecollectionNamespacedPod
    , readNamespacedPod
    , replaceNamespacedPod
    , deleteNamespacedPod
    , patchNamespacedPod
    , connectGetNamespacedPodAttach
    , connectPostNamespacedPodAttach
    , createNamespacedBindingBinding
    , connectGetNamespacedPodExec
    , connectPostNamespacedPodExec
    , readNamespacedPodLog
    , connectGetNamespacedPodPortforward
    , connectPostNamespacedPodPortforward
    , connectGetNamespacedPodProxy
    , connectHeadNamespacedPodProxy
    , connectPutNamespacedPodProxy
    , connectPostNamespacedPodProxy
    , connectDeleteNamespacedPodProxy
    , connectOptionsNamespacedPodProxy
    , connectGetNamespacedPodProxy_0
    , connectHeadNamespacedPodProxy_0
    , connectPutNamespacedPodProxy_0
    , connectPostNamespacedPodProxy_0
    , connectDeleteNamespacedPodProxy_0
    , connectOptionsNamespacedPodProxy_0
    , replaceNamespacedPodStatus
    , listNamespacedPodTemplate
    , createNamespacedPodTemplate
    , deletecollectionNamespacedPodTemplate
    , readNamespacedPodTemplate
    , replaceNamespacedPodTemplate
    , deleteNamespacedPodTemplate
    , patchNamespacedPodTemplate
    , listNamespacedReplicationController
    , createNamespacedReplicationController
    , deletecollectionNamespacedReplicationController
    , readNamespacedReplicationController
    , replaceNamespacedReplicationController
    , deleteNamespacedReplicationController
    , patchNamespacedReplicationController
    , replaceNamespacedReplicationControllerStatus
    , listNamespacedResourceQuota
    , createNamespacedResourceQuota
    , deletecollectionNamespacedResourceQuota
    , readNamespacedResourceQuota
    , replaceNamespacedResourceQuota
    , deleteNamespacedResourceQuota
    , patchNamespacedResourceQuota
    , replaceNamespacedResourceQuotaStatus
    , listNamespacedSecret
    , createNamespacedSecret
    , deletecollectionNamespacedSecret
    , readNamespacedSecret
    , replaceNamespacedSecret
    , deleteNamespacedSecret
    , patchNamespacedSecret
    , listNamespacedServiceAccount
    , createNamespacedServiceAccount
    , deletecollectionNamespacedServiceAccount
    , readNamespacedServiceAccount
    , replaceNamespacedServiceAccount
    , deleteNamespacedServiceAccount
    , patchNamespacedServiceAccount
    , listNamespacedService
    , createNamespacedService
    , readNamespacedService
    , replaceNamespacedService
    , deleteNamespacedService
    , patchNamespacedService
    , replaceNamespacedServiceStatus
    , readNamespacedNamespace
    , replaceNamespacedNamespace
    , deleteNamespacedNamespace
    , patchNamespacedNamespace
    , replaceNamespacedNamespaceFinalize
    , replaceNamespacedNamespaceStatus
    , listNamespacedNode
    , createNamespacedNode
    , deletecollectionNamespacedNode
    , readNamespacedNode
    , replaceNamespacedNode
    , deleteNamespacedNode
    , patchNamespacedNode
    , replaceNamespacedNodeStatus
    , listPersistentVolumeClaim
    , listNamespacedPersistentVolume
    , createNamespacedPersistentVolume
    , deletecollectionNamespacedPersistentVolume
    , readNamespacedPersistentVolume
    , replaceNamespacedPersistentVolume
    , deleteNamespacedPersistentVolume
    , patchNamespacedPersistentVolume
    , replaceNamespacedPersistentVolumeStatus
    , listPod
    , listPodTemplate
    , proxyGETNamespacedPod
    , proxyHEADNamespacedPod
    , proxyPUTNamespacedPod
    , proxyPOSTNamespacedPod
    , proxyDELETENamespacedPod
    , proxyOPTIONSNamespacedPod
    , proxyGETNamespacedPod_0
    , proxyHEADNamespacedPod_0
    , proxyPUTNamespacedPod_0
    , proxyPOSTNamespacedPod_0
    , proxyDELETENamespacedPod_0
    , proxyOPTIONSNamespacedPod_0
    , proxyGETNamespacedService
    , proxyHEADNamespacedService
    , proxyPUTNamespacedService
    , proxyPOSTNamespacedService
    , proxyDELETENamespacedService
    , proxyOPTIONSNamespacedService
    , proxyGETNamespacedService_0
    , proxyHEADNamespacedService_0
    , proxyPUTNamespacedService_0
    , proxyPOSTNamespacedService_0
    , proxyDELETENamespacedService_0
    , proxyOPTIONSNamespacedService_0
    , proxyGETNamespacedNode
    , proxyHEADNamespacedNode
    , proxyPUTNamespacedNode
    , proxyPOSTNamespacedNode
    , proxyDELETENamespacedNode
    , proxyOPTIONSNamespacedNode
    , proxyGETNamespacedNode_0
    , proxyHEADNamespacedNode_0
    , proxyPUTNamespacedNode_0
    , proxyPOSTNamespacedNode_0
    , proxyDELETENamespacedNode_0
    , proxyOPTIONSNamespacedNode_0
    , listReplicationController
    , listResourceQuota
    , listSecret
    , listServiceAccount
    , listService
    , watchConfigMapList
    , watchEndpointsList
    , watchEventList
    , watchLimitRangeList
    , watchNamespacedNamespaceList
    , watchNamespacedConfigMapList
    , watchNamespacedConfigMap
    , watchNamespacedEndpointsList
    , watchNamespacedEndpoints
    , watchNamespacedEventList
    , watchNamespacedEvent
    , watchNamespacedLimitRangeList
    , watchNamespacedLimitRange
    , watchNamespacedPersistentVolumeClaimList
    , watchNamespacedPersistentVolumeClaim
    , watchNamespacedPodList
    , watchNamespacedPod
    , watchNamespacedPodTemplateList
    , watchNamespacedPodTemplate
    , watchNamespacedReplicationControllerList
    , watchNamespacedReplicationController
    , watchNamespacedResourceQuotaList
    , watchNamespacedResourceQuota
    , watchNamespacedSecretList
    , watchNamespacedSecret
    , watchNamespacedServiceAccountList
    , watchNamespacedServiceAccount
    , watchNamespacedServiceList
    , watchNamespacedService
    , watchNamespacedNamespace
    , watchNamespacedNodeList
    , watchNamespacedNode
    , watchPersistentVolumeClaimList
    , watchNamespacedPersistentVolumeList
    , watchNamespacedPersistentVolume
    , watchPodList
    , watchPodTemplateList
    , watchReplicationControllerList
    , watchResourceQuotaList
    , watchSecretList
    , watchServiceAccountList
    , watchServiceList
    , proxyApivApi
    , ApivApi
    ) where

import GHC.Generics
import Data.Proxy
import Servant.API
import Servant.Client
import Network.URI (URI (..), URIAuth (..), parseURI)
import Data.Maybe (fromMaybe)
import Servant.Common.Text
import Data.List (intercalate)
import qualified Data.Text as T
import Utils
import Test.QuickCheck
import Model.V1.ComponentStatusList
import Model.V1.ComponentStatus
import Model.V1.ConfigMapList
import Model.V1.EndpointsList
import Model.V1.EventList
import Model.V1.LimitRangeList
import Model.V1.NamespaceList
import Model.V1.Namespace
import Model.Unversioned.Status
import Model.V1.Binding
import Model.V1.ConfigMap
import Model.V1.DeleteOptions
import Model.Unversioned.Patch
import Model.V1.Endpoints
import Model.V1.Event
import Model.V1.LimitRange
import Model.V1.PersistentVolumeClaimList
import Model.V1.PersistentVolumeClaim
import Model.V1.PodList
import Model.V1.Pod
import Model.V1.PodTemplateList
import Model.V1.PodTemplate
import Model.V1.ReplicationControllerList
import Model.V1.ReplicationController
import Model.V1.ResourceQuotaList
import Model.V1.ResourceQuota
import Model.V1.SecretList
import Model.V1.Secret
import Model.V1.ServiceAccountList
import Model.V1.ServiceAccount
import Model.V1.ServiceList
import Model.V1.Service
import Model.V1.NodeList
import Model.V1.Node
import Model.V1.PersistentVolumeList
import Model.V1.PersistentVolume
import Model.Json.WatchEvent





































































































































































































































type ApivApi = "api" :> "v1" :> Get '[JSON] () -- getAPIResources
    :<|> "api" :> "v1" :> "componentstatuses" :> QueryParam "pretty" Text :> QueryParam "labelSelector" Text :> QueryParam "fieldSelector" Text :> QueryParam "watch" Bool :> QueryParam "resourceVersion" Text :> QueryParam "timeoutSeconds" Integer :> Get '[JSON] V1.ComponentStatusList -- listNamespacedComponentStatus
    :<|> "api" :> "v1" :> "componentstatuses" :> Capture "name" Text :> QueryParam "pretty" Text :> Get '[JSON] V1.ComponentStatus -- readNamespacedComponentStatus
    :<|> "api" :> "v1" :> "configmaps" :> QueryParam "pretty" Text :> QueryParam "labelSelector" Text :> QueryParam "fieldSelector" Text :> QueryParam "watch" Bool :> QueryParam "resourceVersion" Text :> QueryParam "timeoutSeconds" Integer :> Get '[JSON] V1.ConfigMapList -- listConfigMap
    :<|> "api" :> "v1" :> "endpoints" :> QueryParam "pretty" Text :> QueryParam "labelSelector" Text :> QueryParam "fieldSelector" Text :> QueryParam "watch" Bool :> QueryParam "resourceVersion" Text :> QueryParam "timeoutSeconds" Integer :> Get '[JSON] V1.EndpointsList -- listEndpoints
    :<|> "api" :> "v1" :> "events" :> QueryParam "pretty" Text :> QueryParam "labelSelector" Text :> QueryParam "fieldSelector" Text :> QueryParam "watch" Bool :> QueryParam "resourceVersion" Text :> QueryParam "timeoutSeconds" Integer :> Get '[JSON] V1.EventList -- listEvent
    :<|> "api" :> "v1" :> "limitranges" :> QueryParam "pretty" Text :> QueryParam "labelSelector" Text :> QueryParam "fieldSelector" Text :> QueryParam "watch" Bool :> QueryParam "resourceVersion" Text :> QueryParam "timeoutSeconds" Integer :> Get '[JSON] V1.LimitRangeList -- listLimitRange
    :<|> "api" :> "v1" :> "namespaces" :> QueryParam "pretty" Text :> QueryParam "labelSelector" Text :> QueryParam "fieldSelector" Text :> QueryParam "watch" Bool :> QueryParam "resourceVersion" Text :> QueryParam "timeoutSeconds" Integer :> Get '[JSON] V1.NamespaceList -- listNamespacedNamespace
    :<|> "api" :> "v1" :> "namespaces" :> QueryParam "pretty" Text :> ReqBody '[JSON] V1.Namespace :> Post '[JSON] V1.Namespace -- createNamespacedNamespace
    :<|> "api" :> "v1" :> "namespaces" :> QueryParam "pretty" Text :> QueryParam "labelSelector" Text :> QueryParam "fieldSelector" Text :> QueryParam "watch" Bool :> QueryParam "resourceVersion" Text :> QueryParam "timeoutSeconds" Integer :> Delete '[JSON] Unversioned.Status -- deletecollectionNamespacedNamespace
    :<|> "api" :> "v1" :> "namespaces" :> Capture "namespace" Text :> "bindings" :> QueryParam "pretty" Text :> ReqBody '[JSON] V1.Binding :> Post '[JSON] V1.Binding -- createNamespacedBinding
    :<|> "api" :> "v1" :> "namespaces" :> Capture "namespace" Text :> "configmaps" :> QueryParam "pretty" Text :> QueryParam "labelSelector" Text :> QueryParam "fieldSelector" Text :> QueryParam "watch" Bool :> QueryParam "resourceVersion" Text :> QueryParam "timeoutSeconds" Integer :> Get '[JSON] V1.ConfigMapList -- listNamespacedConfigMap
    :<|> "api" :> "v1" :> "namespaces" :> Capture "namespace" Text :> "configmaps" :> QueryParam "pretty" Text :> ReqBody '[JSON] V1.ConfigMap :> Post '[JSON] V1.ConfigMap -- createNamespacedConfigMap
    :<|> "api" :> "v1" :> "namespaces" :> Capture "namespace" Text :> "configmaps" :> QueryParam "pretty" Text :> QueryParam "labelSelector" Text :> QueryParam "fieldSelector" Text :> QueryParam "watch" Bool :> QueryParam "resourceVersion" Text :> QueryParam "timeoutSeconds" Integer :> Delete '[JSON] Unversioned.Status -- deletecollectionNamespacedConfigMap
    :<|> "api" :> "v1" :> "namespaces" :> Capture "namespace" Text :> "configmaps" :> Capture "name" Text :> QueryParam "pretty" Text :> QueryParam "export" Bool :> QueryParam "exact" Bool :> Get '[JSON] V1.ConfigMap -- readNamespacedConfigMap
    :<|> "api" :> "v1" :> "namespaces" :> Capture "namespace" Text :> "configmaps" :> Capture "name" Text :> QueryParam "pretty" Text :> ReqBody '[JSON] V1.ConfigMap :> Put '[JSON] V1.ConfigMap -- replaceNamespacedConfigMap
    :<|> "api" :> "v1" :> "namespaces" :> Capture "namespace" Text :> "configmaps" :> Capture "name" Text :> QueryParam "pretty" Text :> ReqBody '[JSON] V1.DeleteOptions :> Delete '[JSON] Unversioned.Status -- deleteNamespacedConfigMap
    :<|> "api" :> "v1" :> "namespaces" :> Capture "namespace" Text :> "configmaps" :> Capture "name" Text :> QueryParam "pretty" Text :> ReqBody '[JSON] Unversioned.Patch :> Patch '[JSON] V1.ConfigMap -- patchNamespacedConfigMap
    :<|> "api" :> "v1" :> "namespaces" :> Capture "namespace" Text :> "endpoints" :> QueryParam "pretty" Text :> QueryParam "labelSelector" Text :> QueryParam "fieldSelector" Text :> QueryParam "watch" Bool :> QueryParam "resourceVersion" Text :> QueryParam "timeoutSeconds" Integer :> Get '[JSON] V1.EndpointsList -- listNamespacedEndpoints
    :<|> "api" :> "v1" :> "namespaces" :> Capture "namespace" Text :> "endpoints" :> QueryParam "pretty" Text :> ReqBody '[JSON] V1.Endpoints :> Post '[JSON] V1.Endpoints -- createNamespacedEndpoints
    :<|> "api" :> "v1" :> "namespaces" :> Capture "namespace" Text :> "endpoints" :> QueryParam "pretty" Text :> QueryParam "labelSelector" Text :> QueryParam "fieldSelector" Text :> QueryParam "watch" Bool :> QueryParam "resourceVersion" Text :> QueryParam "timeoutSeconds" Integer :> Delete '[JSON] Unversioned.Status -- deletecollectionNamespacedEndpoints
    :<|> "api" :> "v1" :> "namespaces" :> Capture "namespace" Text :> "endpoints" :> Capture "name" Text :> QueryParam "pretty" Text :> QueryParam "export" Bool :> QueryParam "exact" Bool :> Get '[JSON] V1.Endpoints -- readNamespacedEndpoints
    :<|> "api" :> "v1" :> "namespaces" :> Capture "namespace" Text :> "endpoints" :> Capture "name" Text :> QueryParam "pretty" Text :> ReqBody '[JSON] V1.Endpoints :> Put '[JSON] V1.Endpoints -- replaceNamespacedEndpoints
    :<|> "api" :> "v1" :> "namespaces" :> Capture "namespace" Text :> "endpoints" :> Capture "name" Text :> QueryParam "pretty" Text :> ReqBody '[JSON] V1.DeleteOptions :> Delete '[JSON] Unversioned.Status -- deleteNamespacedEndpoints
    :<|> "api" :> "v1" :> "namespaces" :> Capture "namespace" Text :> "endpoints" :> Capture "name" Text :> QueryParam "pretty" Text :> ReqBody '[JSON] Unversioned.Patch :> Patch '[JSON] V1.Endpoints -- patchNamespacedEndpoints
    :<|> "api" :> "v1" :> "namespaces" :> Capture "namespace" Text :> "events" :> QueryParam "pretty" Text :> QueryParam "labelSelector" Text :> QueryParam "fieldSelector" Text :> QueryParam "watch" Bool :> QueryParam "resourceVersion" Text :> QueryParam "timeoutSeconds" Integer :> Get '[JSON] V1.EventList -- listNamespacedEvent
    :<|> "api" :> "v1" :> "namespaces" :> Capture "namespace" Text :> "events" :> QueryParam "pretty" Text :> ReqBody '[JSON] V1.Event :> Post '[JSON] V1.Event -- createNamespacedEvent
    :<|> "api" :> "v1" :> "namespaces" :> Capture "namespace" Text :> "events" :> QueryParam "pretty" Text :> QueryParam "labelSelector" Text :> QueryParam "fieldSelector" Text :> QueryParam "watch" Bool :> QueryParam "resourceVersion" Text :> QueryParam "timeoutSeconds" Integer :> Delete '[JSON] Unversioned.Status -- deletecollectionNamespacedEvent
    :<|> "api" :> "v1" :> "namespaces" :> Capture "namespace" Text :> "events" :> Capture "name" Text :> QueryParam "pretty" Text :> QueryParam "export" Bool :> QueryParam "exact" Bool :> Get '[JSON] V1.Event -- readNamespacedEvent
    :<|> "api" :> "v1" :> "namespaces" :> Capture "namespace" Text :> "events" :> Capture "name" Text :> QueryParam "pretty" Text :> ReqBody '[JSON] V1.Event :> Put '[JSON] V1.Event -- replaceNamespacedEvent
    :<|> "api" :> "v1" :> "namespaces" :> Capture "namespace" Text :> "events" :> Capture "name" Text :> QueryParam "pretty" Text :> ReqBody '[JSON] V1.DeleteOptions :> Delete '[JSON] Unversioned.Status -- deleteNamespacedEvent
    :<|> "api" :> "v1" :> "namespaces" :> Capture "namespace" Text :> "events" :> Capture "name" Text :> QueryParam "pretty" Text :> ReqBody '[JSON] Unversioned.Patch :> Patch '[JSON] V1.Event -- patchNamespacedEvent
    :<|> "api" :> "v1" :> "namespaces" :> Capture "namespace" Text :> "limitranges" :> QueryParam "pretty" Text :> QueryParam "labelSelector" Text :> QueryParam "fieldSelector" Text :> QueryParam "watch" Bool :> QueryParam "resourceVersion" Text :> QueryParam "timeoutSeconds" Integer :> Get '[JSON] V1.LimitRangeList -- listNamespacedLimitRange
    :<|> "api" :> "v1" :> "namespaces" :> Capture "namespace" Text :> "limitranges" :> QueryParam "pretty" Text :> ReqBody '[JSON] V1.LimitRange :> Post '[JSON] V1.LimitRange -- createNamespacedLimitRange
    :<|> "api" :> "v1" :> "namespaces" :> Capture "namespace" Text :> "limitranges" :> QueryParam "pretty" Text :> QueryParam "labelSelector" Text :> QueryParam "fieldSelector" Text :> QueryParam "watch" Bool :> QueryParam "resourceVersion" Text :> QueryParam "timeoutSeconds" Integer :> Delete '[JSON] Unversioned.Status -- deletecollectionNamespacedLimitRange
    :<|> "api" :> "v1" :> "namespaces" :> Capture "namespace" Text :> "limitranges" :> Capture "name" Text :> QueryParam "pretty" Text :> QueryParam "export" Bool :> QueryParam "exact" Bool :> Get '[JSON] V1.LimitRange -- readNamespacedLimitRange
    :<|> "api" :> "v1" :> "namespaces" :> Capture "namespace" Text :> "limitranges" :> Capture "name" Text :> QueryParam "pretty" Text :> ReqBody '[JSON] V1.LimitRange :> Put '[JSON] V1.LimitRange -- replaceNamespacedLimitRange
    :<|> "api" :> "v1" :> "namespaces" :> Capture "namespace" Text :> "limitranges" :> Capture "name" Text :> QueryParam "pretty" Text :> ReqBody '[JSON] V1.DeleteOptions :> Delete '[JSON] Unversioned.Status -- deleteNamespacedLimitRange
    :<|> "api" :> "v1" :> "namespaces" :> Capture "namespace" Text :> "limitranges" :> Capture "name" Text :> QueryParam "pretty" Text :> ReqBody '[JSON] Unversioned.Patch :> Patch '[JSON] V1.LimitRange -- patchNamespacedLimitRange
    :<|> "api" :> "v1" :> "namespaces" :> Capture "namespace" Text :> "persistentvolumeclaims" :> QueryParam "pretty" Text :> QueryParam "labelSelector" Text :> QueryParam "fieldSelector" Text :> QueryParam "watch" Bool :> QueryParam "resourceVersion" Text :> QueryParam "timeoutSeconds" Integer :> Get '[JSON] V1.PersistentVolumeClaimList -- listNamespacedPersistentVolumeClaim
    :<|> "api" :> "v1" :> "namespaces" :> Capture "namespace" Text :> "persistentvolumeclaims" :> QueryParam "pretty" Text :> ReqBody '[JSON] V1.PersistentVolumeClaim :> Post '[JSON] V1.PersistentVolumeClaim -- createNamespacedPersistentVolumeClaim
    :<|> "api" :> "v1" :> "namespaces" :> Capture "namespace" Text :> "persistentvolumeclaims" :> QueryParam "pretty" Text :> QueryParam "labelSelector" Text :> QueryParam "fieldSelector" Text :> QueryParam "watch" Bool :> QueryParam "resourceVersion" Text :> QueryParam "timeoutSeconds" Integer :> Delete '[JSON] Unversioned.Status -- deletecollectionNamespacedPersistentVolumeClaim
    :<|> "api" :> "v1" :> "namespaces" :> Capture "namespace" Text :> "persistentvolumeclaims" :> Capture "name" Text :> QueryParam "pretty" Text :> QueryParam "export" Bool :> QueryParam "exact" Bool :> Get '[JSON] V1.PersistentVolumeClaim -- readNamespacedPersistentVolumeClaim
    :<|> "api" :> "v1" :> "namespaces" :> Capture "namespace" Text :> "persistentvolumeclaims" :> Capture "name" Text :> QueryParam "pretty" Text :> ReqBody '[JSON] V1.PersistentVolumeClaim :> Put '[JSON] V1.PersistentVolumeClaim -- replaceNamespacedPersistentVolumeClaim
    :<|> "api" :> "v1" :> "namespaces" :> Capture "namespace" Text :> "persistentvolumeclaims" :> Capture "name" Text :> QueryParam "pretty" Text :> ReqBody '[JSON] V1.DeleteOptions :> Delete '[JSON] Unversioned.Status -- deleteNamespacedPersistentVolumeClaim
    :<|> "api" :> "v1" :> "namespaces" :> Capture "namespace" Text :> "persistentvolumeclaims" :> Capture "name" Text :> QueryParam "pretty" Text :> ReqBody '[JSON] Unversioned.Patch :> Patch '[JSON] V1.PersistentVolumeClaim -- patchNamespacedPersistentVolumeClaim
    :<|> "api" :> "v1" :> "namespaces" :> Capture "namespace" Text :> "persistentvolumeclaims" :> Capture "name" Text :> "status" :> QueryParam "pretty" Text :> ReqBody '[JSON] V1.PersistentVolumeClaim :> Put '[JSON] V1.PersistentVolumeClaim -- replaceNamespacedPersistentVolumeClaimStatus
    :<|> "api" :> "v1" :> "namespaces" :> Capture "namespace" Text :> "pods" :> QueryParam "pretty" Text :> QueryParam "labelSelector" Text :> QueryParam "fieldSelector" Text :> QueryParam "watch" Bool :> QueryParam "resourceVersion" Text :> QueryParam "timeoutSeconds" Integer :> Get '[JSON] V1.PodList -- listNamespacedPod
    :<|> "api" :> "v1" :> "namespaces" :> Capture "namespace" Text :> "pods" :> QueryParam "pretty" Text :> ReqBody '[JSON] V1.Pod :> Post '[JSON] V1.Pod -- createNamespacedPod
    :<|> "api" :> "v1" :> "namespaces" :> Capture "namespace" Text :> "pods" :> QueryParam "pretty" Text :> QueryParam "labelSelector" Text :> QueryParam "fieldSelector" Text :> QueryParam "watch" Bool :> QueryParam "resourceVersion" Text :> QueryParam "timeoutSeconds" Integer :> Delete '[JSON] Unversioned.Status -- deletecollectionNamespacedPod
    :<|> "api" :> "v1" :> "namespaces" :> Capture "namespace" Text :> "pods" :> Capture "name" Text :> QueryParam "pretty" Text :> QueryParam "export" Bool :> QueryParam "exact" Bool :> Get '[JSON] V1.Pod -- readNamespacedPod
    :<|> "api" :> "v1" :> "namespaces" :> Capture "namespace" Text :> "pods" :> Capture "name" Text :> QueryParam "pretty" Text :> ReqBody '[JSON] V1.Pod :> Put '[JSON] V1.Pod -- replaceNamespacedPod
    :<|> "api" :> "v1" :> "namespaces" :> Capture "namespace" Text :> "pods" :> Capture "name" Text :> QueryParam "pretty" Text :> ReqBody '[JSON] V1.DeleteOptions :> Delete '[JSON] Unversioned.Status -- deleteNamespacedPod
    :<|> "api" :> "v1" :> "namespaces" :> Capture "namespace" Text :> "pods" :> Capture "name" Text :> QueryParam "pretty" Text :> ReqBody '[JSON] Unversioned.Patch :> Patch '[JSON] V1.Pod -- patchNamespacedPod
    :<|> "api" :> "v1" :> "namespaces" :> Capture "namespace" Text :> "pods" :> Capture "name" Text :> "attach" :> QueryParam "stdin" Bool :> QueryParam "stdout" Bool :> QueryParam "stderr" Bool :> QueryParam "tty" Bool :> QueryParam "container" Text :> Get '[JSON] Text -- connectGetNamespacedPodAttach
    :<|> "api" :> "v1" :> "namespaces" :> Capture "namespace" Text :> "pods" :> Capture "name" Text :> "attach" :> QueryParam "stdin" Bool :> QueryParam "stdout" Bool :> QueryParam "stderr" Bool :> QueryParam "tty" Bool :> QueryParam "container" Text :> Post '[JSON] Text -- connectPostNamespacedPodAttach
    :<|> "api" :> "v1" :> "namespaces" :> Capture "namespace" Text :> "pods" :> Capture "name" Text :> "binding" :> QueryParam "pretty" Text :> ReqBody '[JSON] V1.Binding :> Post '[JSON] V1.Binding -- createNamespacedBindingBinding
    :<|> "api" :> "v1" :> "namespaces" :> Capture "namespace" Text :> "pods" :> Capture "name" Text :> "exec" :> QueryParam "stdin" Bool :> QueryParam "stdout" Bool :> QueryParam "stderr" Bool :> QueryParam "tty" Bool :> QueryParam "container" Text :> QueryParam "command" Text :> Get '[JSON] Text -- connectGetNamespacedPodExec
    :<|> "api" :> "v1" :> "namespaces" :> Capture "namespace" Text :> "pods" :> Capture "name" Text :> "exec" :> QueryParam "stdin" Bool :> QueryParam "stdout" Bool :> QueryParam "stderr" Bool :> QueryParam "tty" Bool :> QueryParam "container" Text :> QueryParam "command" Text :> Post '[JSON] Text -- connectPostNamespacedPodExec
    :<|> "api" :> "v1" :> "namespaces" :> Capture "namespace" Text :> "pods" :> Capture "name" Text :> "log" :> QueryParam "pretty" Text :> QueryParam "container" Text :> QueryParam "follow" Bool :> QueryParam "previous" Bool :> QueryParam "sinceSeconds" Integer :> QueryParam "sinceTime" Text :> QueryParam "timestamps" Bool :> QueryParam "tailLines" Integer :> QueryParam "limitBytes" Integer :> Get '[JSON] V1.Pod -- readNamespacedPodLog
    :<|> "api" :> "v1" :> "namespaces" :> Capture "namespace" Text :> "pods" :> Capture "name" Text :> "portforward" :> Get '[JSON] Text -- connectGetNamespacedPodPortforward
    :<|> "api" :> "v1" :> "namespaces" :> Capture "namespace" Text :> "pods" :> Capture "name" Text :> "portforward" :> Post '[JSON] Text -- connectPostNamespacedPodPortforward
    :<|> "api" :> "v1" :> "namespaces" :> Capture "namespace" Text :> "pods" :> Capture "name" Text :> "proxy" :> QueryParam "path" Text :> Get '[JSON] Text -- connectGetNamespacedPodProxy
    :<|> "api" :> "v1" :> "namespaces" :> Capture "namespace" Text :> "pods" :> Capture "name" Text :> "proxy" :> QueryParam "path" Text :> Head '[JSON] Text -- connectHeadNamespacedPodProxy
    :<|> "api" :> "v1" :> "namespaces" :> Capture "namespace" Text :> "pods" :> Capture "name" Text :> "proxy" :> QueryParam "path" Text :> Put '[JSON] Text -- connectPutNamespacedPodProxy
    :<|> "api" :> "v1" :> "namespaces" :> Capture "namespace" Text :> "pods" :> Capture "name" Text :> "proxy" :> QueryParam "path" Text :> Post '[JSON] Text -- connectPostNamespacedPodProxy
    :<|> "api" :> "v1" :> "namespaces" :> Capture "namespace" Text :> "pods" :> Capture "name" Text :> "proxy" :> QueryParam "path" Text :> Delete '[JSON] Text -- connectDeleteNamespacedPodProxy
    :<|> "api" :> "v1" :> "namespaces" :> Capture "namespace" Text :> "pods" :> Capture "name" Text :> "proxy" :> QueryParam "path" Text :> Options '[JSON] Text -- connectOptionsNamespacedPodProxy
    :<|> "api" :> "v1" :> "namespaces" :> Capture "namespace" Text :> "pods" :> Capture "name" Text :> "proxy" :> Capture "path" Text :> QueryParam "path" Text :> Get '[JSON] Text -- connectGetNamespacedPodProxy_0
    :<|> "api" :> "v1" :> "namespaces" :> Capture "namespace" Text :> "pods" :> Capture "name" Text :> "proxy" :> Capture "path" Text :> QueryParam "path" Text :> Head '[JSON] Text -- connectHeadNamespacedPodProxy_0
    :<|> "api" :> "v1" :> "namespaces" :> Capture "namespace" Text :> "pods" :> Capture "name" Text :> "proxy" :> Capture "path" Text :> QueryParam "path" Text :> Put '[JSON] Text -- connectPutNamespacedPodProxy_0
    :<|> "api" :> "v1" :> "namespaces" :> Capture "namespace" Text :> "pods" :> Capture "name" Text :> "proxy" :> Capture "path" Text :> QueryParam "path" Text :> Post '[JSON] Text -- connectPostNamespacedPodProxy_0
    :<|> "api" :> "v1" :> "namespaces" :> Capture "namespace" Text :> "pods" :> Capture "name" Text :> "proxy" :> Capture "path" Text :> QueryParam "path" Text :> Delete '[JSON] Text -- connectDeleteNamespacedPodProxy_0
    :<|> "api" :> "v1" :> "namespaces" :> Capture "namespace" Text :> "pods" :> Capture "name" Text :> "proxy" :> Capture "path" Text :> QueryParam "path" Text :> Options '[JSON] Text -- connectOptionsNamespacedPodProxy_0
    :<|> "api" :> "v1" :> "namespaces" :> Capture "namespace" Text :> "pods" :> Capture "name" Text :> "status" :> QueryParam "pretty" Text :> ReqBody '[JSON] V1.Pod :> Put '[JSON] V1.Pod -- replaceNamespacedPodStatus
    :<|> "api" :> "v1" :> "namespaces" :> Capture "namespace" Text :> "podtemplates" :> QueryParam "pretty" Text :> QueryParam "labelSelector" Text :> QueryParam "fieldSelector" Text :> QueryParam "watch" Bool :> QueryParam "resourceVersion" Text :> QueryParam "timeoutSeconds" Integer :> Get '[JSON] V1.PodTemplateList -- listNamespacedPodTemplate
    :<|> "api" :> "v1" :> "namespaces" :> Capture "namespace" Text :> "podtemplates" :> QueryParam "pretty" Text :> ReqBody '[JSON] V1.PodTemplate :> Post '[JSON] V1.PodTemplate -- createNamespacedPodTemplate
    :<|> "api" :> "v1" :> "namespaces" :> Capture "namespace" Text :> "podtemplates" :> QueryParam "pretty" Text :> QueryParam "labelSelector" Text :> QueryParam "fieldSelector" Text :> QueryParam "watch" Bool :> QueryParam "resourceVersion" Text :> QueryParam "timeoutSeconds" Integer :> Delete '[JSON] Unversioned.Status -- deletecollectionNamespacedPodTemplate
    :<|> "api" :> "v1" :> "namespaces" :> Capture "namespace" Text :> "podtemplates" :> Capture "name" Text :> QueryParam "pretty" Text :> QueryParam "export" Bool :> QueryParam "exact" Bool :> Get '[JSON] V1.PodTemplate -- readNamespacedPodTemplate
    :<|> "api" :> "v1" :> "namespaces" :> Capture "namespace" Text :> "podtemplates" :> Capture "name" Text :> QueryParam "pretty" Text :> ReqBody '[JSON] V1.PodTemplate :> Put '[JSON] V1.PodTemplate -- replaceNamespacedPodTemplate
    :<|> "api" :> "v1" :> "namespaces" :> Capture "namespace" Text :> "podtemplates" :> Capture "name" Text :> QueryParam "pretty" Text :> ReqBody '[JSON] V1.DeleteOptions :> Delete '[JSON] Unversioned.Status -- deleteNamespacedPodTemplate
    :<|> "api" :> "v1" :> "namespaces" :> Capture "namespace" Text :> "podtemplates" :> Capture "name" Text :> QueryParam "pretty" Text :> ReqBody '[JSON] Unversioned.Patch :> Patch '[JSON] V1.PodTemplate -- patchNamespacedPodTemplate
    :<|> "api" :> "v1" :> "namespaces" :> Capture "namespace" Text :> "replicationcontrollers" :> QueryParam "pretty" Text :> QueryParam "labelSelector" Text :> QueryParam "fieldSelector" Text :> QueryParam "watch" Bool :> QueryParam "resourceVersion" Text :> QueryParam "timeoutSeconds" Integer :> Get '[JSON] V1.ReplicationControllerList -- listNamespacedReplicationController
    :<|> "api" :> "v1" :> "namespaces" :> Capture "namespace" Text :> "replicationcontrollers" :> QueryParam "pretty" Text :> ReqBody '[JSON] V1.ReplicationController :> Post '[JSON] V1.ReplicationController -- createNamespacedReplicationController
    :<|> "api" :> "v1" :> "namespaces" :> Capture "namespace" Text :> "replicationcontrollers" :> QueryParam "pretty" Text :> QueryParam "labelSelector" Text :> QueryParam "fieldSelector" Text :> QueryParam "watch" Bool :> QueryParam "resourceVersion" Text :> QueryParam "timeoutSeconds" Integer :> Delete '[JSON] Unversioned.Status -- deletecollectionNamespacedReplicationController
    :<|> "api" :> "v1" :> "namespaces" :> Capture "namespace" Text :> "replicationcontrollers" :> Capture "name" Text :> QueryParam "pretty" Text :> QueryParam "export" Bool :> QueryParam "exact" Bool :> Get '[JSON] V1.ReplicationController -- readNamespacedReplicationController
    :<|> "api" :> "v1" :> "namespaces" :> Capture "namespace" Text :> "replicationcontrollers" :> Capture "name" Text :> QueryParam "pretty" Text :> ReqBody '[JSON] V1.ReplicationController :> Put '[JSON] V1.ReplicationController -- replaceNamespacedReplicationController
    :<|> "api" :> "v1" :> "namespaces" :> Capture "namespace" Text :> "replicationcontrollers" :> Capture "name" Text :> QueryParam "pretty" Text :> ReqBody '[JSON] V1.DeleteOptions :> Delete '[JSON] Unversioned.Status -- deleteNamespacedReplicationController
    :<|> "api" :> "v1" :> "namespaces" :> Capture "namespace" Text :> "replicationcontrollers" :> Capture "name" Text :> QueryParam "pretty" Text :> ReqBody '[JSON] Unversioned.Patch :> Patch '[JSON] V1.ReplicationController -- patchNamespacedReplicationController
    :<|> "api" :> "v1" :> "namespaces" :> Capture "namespace" Text :> "replicationcontrollers" :> Capture "name" Text :> "status" :> QueryParam "pretty" Text :> ReqBody '[JSON] V1.ReplicationController :> Put '[JSON] V1.ReplicationController -- replaceNamespacedReplicationControllerStatus
    :<|> "api" :> "v1" :> "namespaces" :> Capture "namespace" Text :> "resourcequotas" :> QueryParam "pretty" Text :> QueryParam "labelSelector" Text :> QueryParam "fieldSelector" Text :> QueryParam "watch" Bool :> QueryParam "resourceVersion" Text :> QueryParam "timeoutSeconds" Integer :> Get '[JSON] V1.ResourceQuotaList -- listNamespacedResourceQuota
    :<|> "api" :> "v1" :> "namespaces" :> Capture "namespace" Text :> "resourcequotas" :> QueryParam "pretty" Text :> ReqBody '[JSON] V1.ResourceQuota :> Post '[JSON] V1.ResourceQuota -- createNamespacedResourceQuota
    :<|> "api" :> "v1" :> "namespaces" :> Capture "namespace" Text :> "resourcequotas" :> QueryParam "pretty" Text :> QueryParam "labelSelector" Text :> QueryParam "fieldSelector" Text :> QueryParam "watch" Bool :> QueryParam "resourceVersion" Text :> QueryParam "timeoutSeconds" Integer :> Delete '[JSON] Unversioned.Status -- deletecollectionNamespacedResourceQuota
    :<|> "api" :> "v1" :> "namespaces" :> Capture "namespace" Text :> "resourcequotas" :> Capture "name" Text :> QueryParam "pretty" Text :> QueryParam "export" Bool :> QueryParam "exact" Bool :> Get '[JSON] V1.ResourceQuota -- readNamespacedResourceQuota
    :<|> "api" :> "v1" :> "namespaces" :> Capture "namespace" Text :> "resourcequotas" :> Capture "name" Text :> QueryParam "pretty" Text :> ReqBody '[JSON] V1.ResourceQuota :> Put '[JSON] V1.ResourceQuota -- replaceNamespacedResourceQuota
    :<|> "api" :> "v1" :> "namespaces" :> Capture "namespace" Text :> "resourcequotas" :> Capture "name" Text :> QueryParam "pretty" Text :> ReqBody '[JSON] V1.DeleteOptions :> Delete '[JSON] Unversioned.Status -- deleteNamespacedResourceQuota
    :<|> "api" :> "v1" :> "namespaces" :> Capture "namespace" Text :> "resourcequotas" :> Capture "name" Text :> QueryParam "pretty" Text :> ReqBody '[JSON] Unversioned.Patch :> Patch '[JSON] V1.ResourceQuota -- patchNamespacedResourceQuota
    :<|> "api" :> "v1" :> "namespaces" :> Capture "namespace" Text :> "resourcequotas" :> Capture "name" Text :> "status" :> QueryParam "pretty" Text :> ReqBody '[JSON] V1.ResourceQuota :> Put '[JSON] V1.ResourceQuota -- replaceNamespacedResourceQuotaStatus
    :<|> "api" :> "v1" :> "namespaces" :> Capture "namespace" Text :> "secrets" :> QueryParam "pretty" Text :> QueryParam "labelSelector" Text :> QueryParam "fieldSelector" Text :> QueryParam "watch" Bool :> QueryParam "resourceVersion" Text :> QueryParam "timeoutSeconds" Integer :> Get '[JSON] V1.SecretList -- listNamespacedSecret
    :<|> "api" :> "v1" :> "namespaces" :> Capture "namespace" Text :> "secrets" :> QueryParam "pretty" Text :> ReqBody '[JSON] V1.Secret :> Post '[JSON] V1.Secret -- createNamespacedSecret
    :<|> "api" :> "v1" :> "namespaces" :> Capture "namespace" Text :> "secrets" :> QueryParam "pretty" Text :> QueryParam "labelSelector" Text :> QueryParam "fieldSelector" Text :> QueryParam "watch" Bool :> QueryParam "resourceVersion" Text :> QueryParam "timeoutSeconds" Integer :> Delete '[JSON] Unversioned.Status -- deletecollectionNamespacedSecret
    :<|> "api" :> "v1" :> "namespaces" :> Capture "namespace" Text :> "secrets" :> Capture "name" Text :> QueryParam "pretty" Text :> QueryParam "export" Bool :> QueryParam "exact" Bool :> Get '[JSON] V1.Secret -- readNamespacedSecret
    :<|> "api" :> "v1" :> "namespaces" :> Capture "namespace" Text :> "secrets" :> Capture "name" Text :> QueryParam "pretty" Text :> ReqBody '[JSON] V1.Secret :> Put '[JSON] V1.Secret -- replaceNamespacedSecret
    :<|> "api" :> "v1" :> "namespaces" :> Capture "namespace" Text :> "secrets" :> Capture "name" Text :> QueryParam "pretty" Text :> ReqBody '[JSON] V1.DeleteOptions :> Delete '[JSON] Unversioned.Status -- deleteNamespacedSecret
    :<|> "api" :> "v1" :> "namespaces" :> Capture "namespace" Text :> "secrets" :> Capture "name" Text :> QueryParam "pretty" Text :> ReqBody '[JSON] Unversioned.Patch :> Patch '[JSON] V1.Secret -- patchNamespacedSecret
    :<|> "api" :> "v1" :> "namespaces" :> Capture "namespace" Text :> "serviceaccounts" :> QueryParam "pretty" Text :> QueryParam "labelSelector" Text :> QueryParam "fieldSelector" Text :> QueryParam "watch" Bool :> QueryParam "resourceVersion" Text :> QueryParam "timeoutSeconds" Integer :> Get '[JSON] V1.ServiceAccountList -- listNamespacedServiceAccount
    :<|> "api" :> "v1" :> "namespaces" :> Capture "namespace" Text :> "serviceaccounts" :> QueryParam "pretty" Text :> ReqBody '[JSON] V1.ServiceAccount :> Post '[JSON] V1.ServiceAccount -- createNamespacedServiceAccount
    :<|> "api" :> "v1" :> "namespaces" :> Capture "namespace" Text :> "serviceaccounts" :> QueryParam "pretty" Text :> QueryParam "labelSelector" Text :> QueryParam "fieldSelector" Text :> QueryParam "watch" Bool :> QueryParam "resourceVersion" Text :> QueryParam "timeoutSeconds" Integer :> Delete '[JSON] Unversioned.Status -- deletecollectionNamespacedServiceAccount
    :<|> "api" :> "v1" :> "namespaces" :> Capture "namespace" Text :> "serviceaccounts" :> Capture "name" Text :> QueryParam "pretty" Text :> QueryParam "export" Bool :> QueryParam "exact" Bool :> Get '[JSON] V1.ServiceAccount -- readNamespacedServiceAccount
    :<|> "api" :> "v1" :> "namespaces" :> Capture "namespace" Text :> "serviceaccounts" :> Capture "name" Text :> QueryParam "pretty" Text :> ReqBody '[JSON] V1.ServiceAccount :> Put '[JSON] V1.ServiceAccount -- replaceNamespacedServiceAccount
    :<|> "api" :> "v1" :> "namespaces" :> Capture "namespace" Text :> "serviceaccounts" :> Capture "name" Text :> QueryParam "pretty" Text :> ReqBody '[JSON] V1.DeleteOptions :> Delete '[JSON] Unversioned.Status -- deleteNamespacedServiceAccount
    :<|> "api" :> "v1" :> "namespaces" :> Capture "namespace" Text :> "serviceaccounts" :> Capture "name" Text :> QueryParam "pretty" Text :> ReqBody '[JSON] Unversioned.Patch :> Patch '[JSON] V1.ServiceAccount -- patchNamespacedServiceAccount
    :<|> "api" :> "v1" :> "namespaces" :> Capture "namespace" Text :> "services" :> QueryParam "pretty" Text :> QueryParam "labelSelector" Text :> QueryParam "fieldSelector" Text :> QueryParam "watch" Bool :> QueryParam "resourceVersion" Text :> QueryParam "timeoutSeconds" Integer :> Get '[JSON] V1.ServiceList -- listNamespacedService
    :<|> "api" :> "v1" :> "namespaces" :> Capture "namespace" Text :> "services" :> QueryParam "pretty" Text :> ReqBody '[JSON] V1.Service :> Post '[JSON] V1.Service -- createNamespacedService
    :<|> "api" :> "v1" :> "namespaces" :> Capture "namespace" Text :> "services" :> Capture "name" Text :> QueryParam "pretty" Text :> Get '[JSON] V1.Service -- readNamespacedService
    :<|> "api" :> "v1" :> "namespaces" :> Capture "namespace" Text :> "services" :> Capture "name" Text :> QueryParam "pretty" Text :> ReqBody '[JSON] V1.Service :> Put '[JSON] V1.Service -- replaceNamespacedService
    :<|> "api" :> "v1" :> "namespaces" :> Capture "namespace" Text :> "services" :> Capture "name" Text :> QueryParam "pretty" Text :> Delete '[JSON] Unversioned.Status -- deleteNamespacedService
    :<|> "api" :> "v1" :> "namespaces" :> Capture "namespace" Text :> "services" :> Capture "name" Text :> QueryParam "pretty" Text :> ReqBody '[JSON] Unversioned.Patch :> Patch '[JSON] V1.Service -- patchNamespacedService
    :<|> "api" :> "v1" :> "namespaces" :> Capture "namespace" Text :> "services" :> Capture "name" Text :> "status" :> QueryParam "pretty" Text :> ReqBody '[JSON] V1.Service :> Put '[JSON] V1.Service -- replaceNamespacedServiceStatus
    :<|> "api" :> "v1" :> "namespaces" :> Capture "name" Text :> QueryParam "pretty" Text :> QueryParam "export" Bool :> QueryParam "exact" Bool :> Get '[JSON] V1.Namespace -- readNamespacedNamespace
    :<|> "api" :> "v1" :> "namespaces" :> Capture "name" Text :> QueryParam "pretty" Text :> ReqBody '[JSON] V1.Namespace :> Put '[JSON] V1.Namespace -- replaceNamespacedNamespace
    :<|> "api" :> "v1" :> "namespaces" :> Capture "name" Text :> QueryParam "pretty" Text :> ReqBody '[JSON] V1.DeleteOptions :> Delete '[JSON] Unversioned.Status -- deleteNamespacedNamespace
    :<|> "api" :> "v1" :> "namespaces" :> Capture "name" Text :> QueryParam "pretty" Text :> ReqBody '[JSON] Unversioned.Patch :> Patch '[JSON] V1.Namespace -- patchNamespacedNamespace
    :<|> "api" :> "v1" :> "namespaces" :> Capture "name" Text :> "finalize" :> QueryParam "pretty" Text :> ReqBody '[JSON] V1.Namespace :> Put '[JSON] V1.Namespace -- replaceNamespacedNamespaceFinalize
    :<|> "api" :> "v1" :> "namespaces" :> Capture "name" Text :> "status" :> QueryParam "pretty" Text :> ReqBody '[JSON] V1.Namespace :> Put '[JSON] V1.Namespace -- replaceNamespacedNamespaceStatus
    :<|> "api" :> "v1" :> "nodes" :> QueryParam "pretty" Text :> QueryParam "labelSelector" Text :> QueryParam "fieldSelector" Text :> QueryParam "watch" Bool :> QueryParam "resourceVersion" Text :> QueryParam "timeoutSeconds" Integer :> Get '[JSON] V1.NodeList -- listNamespacedNode
    :<|> "api" :> "v1" :> "nodes" :> QueryParam "pretty" Text :> ReqBody '[JSON] V1.Node :> Post '[JSON] V1.Node -- createNamespacedNode
    :<|> "api" :> "v1" :> "nodes" :> QueryParam "pretty" Text :> QueryParam "labelSelector" Text :> QueryParam "fieldSelector" Text :> QueryParam "watch" Bool :> QueryParam "resourceVersion" Text :> QueryParam "timeoutSeconds" Integer :> Delete '[JSON] Unversioned.Status -- deletecollectionNamespacedNode
    :<|> "api" :> "v1" :> "nodes" :> Capture "name" Text :> QueryParam "pretty" Text :> QueryParam "export" Bool :> QueryParam "exact" Bool :> Get '[JSON] V1.Node -- readNamespacedNode
    :<|> "api" :> "v1" :> "nodes" :> Capture "name" Text :> QueryParam "pretty" Text :> ReqBody '[JSON] V1.Node :> Put '[JSON] V1.Node -- replaceNamespacedNode
    :<|> "api" :> "v1" :> "nodes" :> Capture "name" Text :> QueryParam "pretty" Text :> ReqBody '[JSON] V1.DeleteOptions :> Delete '[JSON] Unversioned.Status -- deleteNamespacedNode
    :<|> "api" :> "v1" :> "nodes" :> Capture "name" Text :> QueryParam "pretty" Text :> ReqBody '[JSON] Unversioned.Patch :> Patch '[JSON] V1.Node -- patchNamespacedNode
    :<|> "api" :> "v1" :> "nodes" :> Capture "name" Text :> "status" :> QueryParam "pretty" Text :> ReqBody '[JSON] V1.Node :> Put '[JSON] V1.Node -- replaceNamespacedNodeStatus
    :<|> "api" :> "v1" :> "persistentvolumeclaims" :> QueryParam "pretty" Text :> QueryParam "labelSelector" Text :> QueryParam "fieldSelector" Text :> QueryParam "watch" Bool :> QueryParam "resourceVersion" Text :> QueryParam "timeoutSeconds" Integer :> Get '[JSON] V1.PersistentVolumeClaimList -- listPersistentVolumeClaim
    :<|> "api" :> "v1" :> "persistentvolumes" :> QueryParam "pretty" Text :> QueryParam "labelSelector" Text :> QueryParam "fieldSelector" Text :> QueryParam "watch" Bool :> QueryParam "resourceVersion" Text :> QueryParam "timeoutSeconds" Integer :> Get '[JSON] V1.PersistentVolumeList -- listNamespacedPersistentVolume
    :<|> "api" :> "v1" :> "persistentvolumes" :> QueryParam "pretty" Text :> ReqBody '[JSON] V1.PersistentVolume :> Post '[JSON] V1.PersistentVolume -- createNamespacedPersistentVolume
    :<|> "api" :> "v1" :> "persistentvolumes" :> QueryParam "pretty" Text :> QueryParam "labelSelector" Text :> QueryParam "fieldSelector" Text :> QueryParam "watch" Bool :> QueryParam "resourceVersion" Text :> QueryParam "timeoutSeconds" Integer :> Delete '[JSON] Unversioned.Status -- deletecollectionNamespacedPersistentVolume
    :<|> "api" :> "v1" :> "persistentvolumes" :> Capture "name" Text :> QueryParam "pretty" Text :> QueryParam "export" Bool :> QueryParam "exact" Bool :> Get '[JSON] V1.PersistentVolume -- readNamespacedPersistentVolume
    :<|> "api" :> "v1" :> "persistentvolumes" :> Capture "name" Text :> QueryParam "pretty" Text :> ReqBody '[JSON] V1.PersistentVolume :> Put '[JSON] V1.PersistentVolume -- replaceNamespacedPersistentVolume
    :<|> "api" :> "v1" :> "persistentvolumes" :> Capture "name" Text :> QueryParam "pretty" Text :> ReqBody '[JSON] V1.DeleteOptions :> Delete '[JSON] Unversioned.Status -- deleteNamespacedPersistentVolume
    :<|> "api" :> "v1" :> "persistentvolumes" :> Capture "name" Text :> QueryParam "pretty" Text :> ReqBody '[JSON] Unversioned.Patch :> Patch '[JSON] V1.PersistentVolume -- patchNamespacedPersistentVolume
    :<|> "api" :> "v1" :> "persistentvolumes" :> Capture "name" Text :> "status" :> QueryParam "pretty" Text :> ReqBody '[JSON] V1.PersistentVolume :> Put '[JSON] V1.PersistentVolume -- replaceNamespacedPersistentVolumeStatus
    :<|> "api" :> "v1" :> "pods" :> QueryParam "pretty" Text :> QueryParam "labelSelector" Text :> QueryParam "fieldSelector" Text :> QueryParam "watch" Bool :> QueryParam "resourceVersion" Text :> QueryParam "timeoutSeconds" Integer :> Get '[JSON] V1.PodList -- listPod
    :<|> "api" :> "v1" :> "podtemplates" :> QueryParam "pretty" Text :> QueryParam "labelSelector" Text :> QueryParam "fieldSelector" Text :> QueryParam "watch" Bool :> QueryParam "resourceVersion" Text :> QueryParam "timeoutSeconds" Integer :> Get '[JSON] V1.PodTemplateList -- listPodTemplate
    :<|> "api" :> "v1" :> "proxy" :> "namespaces" :> Capture "namespace" Text :> "pods" :> Capture "name" Text :> Get '[JSON] Text -- proxyGETNamespacedPod
    :<|> "api" :> "v1" :> "proxy" :> "namespaces" :> Capture "namespace" Text :> "pods" :> Capture "name" Text :> Head '[JSON] Text -- proxyHEADNamespacedPod
    :<|> "api" :> "v1" :> "proxy" :> "namespaces" :> Capture "namespace" Text :> "pods" :> Capture "name" Text :> Put '[JSON] Text -- proxyPUTNamespacedPod
    :<|> "api" :> "v1" :> "proxy" :> "namespaces" :> Capture "namespace" Text :> "pods" :> Capture "name" Text :> Post '[JSON] Text -- proxyPOSTNamespacedPod
    :<|> "api" :> "v1" :> "proxy" :> "namespaces" :> Capture "namespace" Text :> "pods" :> Capture "name" Text :> Delete '[JSON] Text -- proxyDELETENamespacedPod
    :<|> "api" :> "v1" :> "proxy" :> "namespaces" :> Capture "namespace" Text :> "pods" :> Capture "name" Text :> Options '[JSON] Text -- proxyOPTIONSNamespacedPod
    :<|> "api" :> "v1" :> "proxy" :> "namespaces" :> Capture "namespace" Text :> "pods" :> Capture "name" Text :> Capture "path" Text :> Get '[JSON] Text -- proxyGETNamespacedPod_0
    :<|> "api" :> "v1" :> "proxy" :> "namespaces" :> Capture "namespace" Text :> "pods" :> Capture "name" Text :> Capture "path" Text :> Head '[JSON] Text -- proxyHEADNamespacedPod_0
    :<|> "api" :> "v1" :> "proxy" :> "namespaces" :> Capture "namespace" Text :> "pods" :> Capture "name" Text :> Capture "path" Text :> Put '[JSON] Text -- proxyPUTNamespacedPod_0
    :<|> "api" :> "v1" :> "proxy" :> "namespaces" :> Capture "namespace" Text :> "pods" :> Capture "name" Text :> Capture "path" Text :> Post '[JSON] Text -- proxyPOSTNamespacedPod_0
    :<|> "api" :> "v1" :> "proxy" :> "namespaces" :> Capture "namespace" Text :> "pods" :> Capture "name" Text :> Capture "path" Text :> Delete '[JSON] Text -- proxyDELETENamespacedPod_0
    :<|> "api" :> "v1" :> "proxy" :> "namespaces" :> Capture "namespace" Text :> "pods" :> Capture "name" Text :> Capture "path" Text :> Options '[JSON] Text -- proxyOPTIONSNamespacedPod_0
    :<|> "api" :> "v1" :> "proxy" :> "namespaces" :> Capture "namespace" Text :> "services" :> Capture "name" Text :> Get '[JSON] Text -- proxyGETNamespacedService
    :<|> "api" :> "v1" :> "proxy" :> "namespaces" :> Capture "namespace" Text :> "services" :> Capture "name" Text :> Head '[JSON] Text -- proxyHEADNamespacedService
    :<|> "api" :> "v1" :> "proxy" :> "namespaces" :> Capture "namespace" Text :> "services" :> Capture "name" Text :> Put '[JSON] Text -- proxyPUTNamespacedService
    :<|> "api" :> "v1" :> "proxy" :> "namespaces" :> Capture "namespace" Text :> "services" :> Capture "name" Text :> Post '[JSON] Text -- proxyPOSTNamespacedService
    :<|> "api" :> "v1" :> "proxy" :> "namespaces" :> Capture "namespace" Text :> "services" :> Capture "name" Text :> Delete '[JSON] Text -- proxyDELETENamespacedService
    :<|> "api" :> "v1" :> "proxy" :> "namespaces" :> Capture "namespace" Text :> "services" :> Capture "name" Text :> Options '[JSON] Text -- proxyOPTIONSNamespacedService
    :<|> "api" :> "v1" :> "proxy" :> "namespaces" :> Capture "namespace" Text :> "services" :> Capture "name" Text :> Capture "path" Text :> Get '[JSON] Text -- proxyGETNamespacedService_0
    :<|> "api" :> "v1" :> "proxy" :> "namespaces" :> Capture "namespace" Text :> "services" :> Capture "name" Text :> Capture "path" Text :> Head '[JSON] Text -- proxyHEADNamespacedService_0
    :<|> "api" :> "v1" :> "proxy" :> "namespaces" :> Capture "namespace" Text :> "services" :> Capture "name" Text :> Capture "path" Text :> Put '[JSON] Text -- proxyPUTNamespacedService_0
    :<|> "api" :> "v1" :> "proxy" :> "namespaces" :> Capture "namespace" Text :> "services" :> Capture "name" Text :> Capture "path" Text :> Post '[JSON] Text -- proxyPOSTNamespacedService_0
    :<|> "api" :> "v1" :> "proxy" :> "namespaces" :> Capture "namespace" Text :> "services" :> Capture "name" Text :> Capture "path" Text :> Delete '[JSON] Text -- proxyDELETENamespacedService_0
    :<|> "api" :> "v1" :> "proxy" :> "namespaces" :> Capture "namespace" Text :> "services" :> Capture "name" Text :> Capture "path" Text :> Options '[JSON] Text -- proxyOPTIONSNamespacedService_0
    :<|> "api" :> "v1" :> "proxy" :> "nodes" :> Capture "name" Text :> Get '[JSON] Text -- proxyGETNamespacedNode
    :<|> "api" :> "v1" :> "proxy" :> "nodes" :> Capture "name" Text :> Head '[JSON] Text -- proxyHEADNamespacedNode
    :<|> "api" :> "v1" :> "proxy" :> "nodes" :> Capture "name" Text :> Put '[JSON] Text -- proxyPUTNamespacedNode
    :<|> "api" :> "v1" :> "proxy" :> "nodes" :> Capture "name" Text :> Post '[JSON] Text -- proxyPOSTNamespacedNode
    :<|> "api" :> "v1" :> "proxy" :> "nodes" :> Capture "name" Text :> Delete '[JSON] Text -- proxyDELETENamespacedNode
    :<|> "api" :> "v1" :> "proxy" :> "nodes" :> Capture "name" Text :> Options '[JSON] Text -- proxyOPTIONSNamespacedNode
    :<|> "api" :> "v1" :> "proxy" :> "nodes" :> Capture "name" Text :> Capture "path" Text :> Get '[JSON] Text -- proxyGETNamespacedNode_0
    :<|> "api" :> "v1" :> "proxy" :> "nodes" :> Capture "name" Text :> Capture "path" Text :> Head '[JSON] Text -- proxyHEADNamespacedNode_0
    :<|> "api" :> "v1" :> "proxy" :> "nodes" :> Capture "name" Text :> Capture "path" Text :> Put '[JSON] Text -- proxyPUTNamespacedNode_0
    :<|> "api" :> "v1" :> "proxy" :> "nodes" :> Capture "name" Text :> Capture "path" Text :> Post '[JSON] Text -- proxyPOSTNamespacedNode_0
    :<|> "api" :> "v1" :> "proxy" :> "nodes" :> Capture "name" Text :> Capture "path" Text :> Delete '[JSON] Text -- proxyDELETENamespacedNode_0
    :<|> "api" :> "v1" :> "proxy" :> "nodes" :> Capture "name" Text :> Capture "path" Text :> Options '[JSON] Text -- proxyOPTIONSNamespacedNode_0
    :<|> "api" :> "v1" :> "replicationcontrollers" :> QueryParam "pretty" Text :> QueryParam "labelSelector" Text :> QueryParam "fieldSelector" Text :> QueryParam "watch" Bool :> QueryParam "resourceVersion" Text :> QueryParam "timeoutSeconds" Integer :> Get '[JSON] V1.ReplicationControllerList -- listReplicationController
    :<|> "api" :> "v1" :> "resourcequotas" :> QueryParam "pretty" Text :> QueryParam "labelSelector" Text :> QueryParam "fieldSelector" Text :> QueryParam "watch" Bool :> QueryParam "resourceVersion" Text :> QueryParam "timeoutSeconds" Integer :> Get '[JSON] V1.ResourceQuotaList -- listResourceQuota
    :<|> "api" :> "v1" :> "secrets" :> QueryParam "pretty" Text :> QueryParam "labelSelector" Text :> QueryParam "fieldSelector" Text :> QueryParam "watch" Bool :> QueryParam "resourceVersion" Text :> QueryParam "timeoutSeconds" Integer :> Get '[JSON] V1.SecretList -- listSecret
    :<|> "api" :> "v1" :> "serviceaccounts" :> QueryParam "pretty" Text :> QueryParam "labelSelector" Text :> QueryParam "fieldSelector" Text :> QueryParam "watch" Bool :> QueryParam "resourceVersion" Text :> QueryParam "timeoutSeconds" Integer :> Get '[JSON] V1.ServiceAccountList -- listServiceAccount
    :<|> "api" :> "v1" :> "services" :> QueryParam "pretty" Text :> QueryParam "labelSelector" Text :> QueryParam "fieldSelector" Text :> QueryParam "watch" Bool :> QueryParam "resourceVersion" Text :> QueryParam "timeoutSeconds" Integer :> Get '[JSON] V1.ServiceList -- listService
    :<|> "api" :> "v1" :> "watch" :> "configmaps" :> QueryParam "pretty" Text :> QueryParam "labelSelector" Text :> QueryParam "fieldSelector" Text :> QueryParam "watch" Bool :> QueryParam "resourceVersion" Text :> QueryParam "timeoutSeconds" Integer :> Get '[JSON] Json.WatchEvent -- watchConfigMapList
    :<|> "api" :> "v1" :> "watch" :> "endpoints" :> QueryParam "pretty" Text :> QueryParam "labelSelector" Text :> QueryParam "fieldSelector" Text :> QueryParam "watch" Bool :> QueryParam "resourceVersion" Text :> QueryParam "timeoutSeconds" Integer :> Get '[JSON] Json.WatchEvent -- watchEndpointsList
    :<|> "api" :> "v1" :> "watch" :> "events" :> QueryParam "pretty" Text :> QueryParam "labelSelector" Text :> QueryParam "fieldSelector" Text :> QueryParam "watch" Bool :> QueryParam "resourceVersion" Text :> QueryParam "timeoutSeconds" Integer :> Get '[JSON] Json.WatchEvent -- watchEventList
    :<|> "api" :> "v1" :> "watch" :> "limitranges" :> QueryParam "pretty" Text :> QueryParam "labelSelector" Text :> QueryParam "fieldSelector" Text :> QueryParam "watch" Bool :> QueryParam "resourceVersion" Text :> QueryParam "timeoutSeconds" Integer :> Get '[JSON] Json.WatchEvent -- watchLimitRangeList
    :<|> "api" :> "v1" :> "watch" :> "namespaces" :> QueryParam "pretty" Text :> QueryParam "labelSelector" Text :> QueryParam "fieldSelector" Text :> QueryParam "watch" Bool :> QueryParam "resourceVersion" Text :> QueryParam "timeoutSeconds" Integer :> Get '[JSON] Json.WatchEvent -- watchNamespacedNamespaceList
    :<|> "api" :> "v1" :> "watch" :> "namespaces" :> Capture "namespace" Text :> "configmaps" :> QueryParam "pretty" Text :> QueryParam "labelSelector" Text :> QueryParam "fieldSelector" Text :> QueryParam "watch" Bool :> QueryParam "resourceVersion" Text :> QueryParam "timeoutSeconds" Integer :> Get '[JSON] Json.WatchEvent -- watchNamespacedConfigMapList
    :<|> "api" :> "v1" :> "watch" :> "namespaces" :> Capture "namespace" Text :> "configmaps" :> Capture "name" Text :> QueryParam "pretty" Text :> QueryParam "labelSelector" Text :> QueryParam "fieldSelector" Text :> QueryParam "watch" Bool :> QueryParam "resourceVersion" Text :> QueryParam "timeoutSeconds" Integer :> Get '[JSON] Json.WatchEvent -- watchNamespacedConfigMap
    :<|> "api" :> "v1" :> "watch" :> "namespaces" :> Capture "namespace" Text :> "endpoints" :> QueryParam "pretty" Text :> QueryParam "labelSelector" Text :> QueryParam "fieldSelector" Text :> QueryParam "watch" Bool :> QueryParam "resourceVersion" Text :> QueryParam "timeoutSeconds" Integer :> Get '[JSON] Json.WatchEvent -- watchNamespacedEndpointsList
    :<|> "api" :> "v1" :> "watch" :> "namespaces" :> Capture "namespace" Text :> "endpoints" :> Capture "name" Text :> QueryParam "pretty" Text :> QueryParam "labelSelector" Text :> QueryParam "fieldSelector" Text :> QueryParam "watch" Bool :> QueryParam "resourceVersion" Text :> QueryParam "timeoutSeconds" Integer :> Get '[JSON] Json.WatchEvent -- watchNamespacedEndpoints
    :<|> "api" :> "v1" :> "watch" :> "namespaces" :> Capture "namespace" Text :> "events" :> QueryParam "pretty" Text :> QueryParam "labelSelector" Text :> QueryParam "fieldSelector" Text :> QueryParam "watch" Bool :> QueryParam "resourceVersion" Text :> QueryParam "timeoutSeconds" Integer :> Get '[JSON] Json.WatchEvent -- watchNamespacedEventList
    :<|> "api" :> "v1" :> "watch" :> "namespaces" :> Capture "namespace" Text :> "events" :> Capture "name" Text :> QueryParam "pretty" Text :> QueryParam "labelSelector" Text :> QueryParam "fieldSelector" Text :> QueryParam "watch" Bool :> QueryParam "resourceVersion" Text :> QueryParam "timeoutSeconds" Integer :> Get '[JSON] Json.WatchEvent -- watchNamespacedEvent
    :<|> "api" :> "v1" :> "watch" :> "namespaces" :> Capture "namespace" Text :> "limitranges" :> QueryParam "pretty" Text :> QueryParam "labelSelector" Text :> QueryParam "fieldSelector" Text :> QueryParam "watch" Bool :> QueryParam "resourceVersion" Text :> QueryParam "timeoutSeconds" Integer :> Get '[JSON] Json.WatchEvent -- watchNamespacedLimitRangeList
    :<|> "api" :> "v1" :> "watch" :> "namespaces" :> Capture "namespace" Text :> "limitranges" :> Capture "name" Text :> QueryParam "pretty" Text :> QueryParam "labelSelector" Text :> QueryParam "fieldSelector" Text :> QueryParam "watch" Bool :> QueryParam "resourceVersion" Text :> QueryParam "timeoutSeconds" Integer :> Get '[JSON] Json.WatchEvent -- watchNamespacedLimitRange
    :<|> "api" :> "v1" :> "watch" :> "namespaces" :> Capture "namespace" Text :> "persistentvolumeclaims" :> QueryParam "pretty" Text :> QueryParam "labelSelector" Text :> QueryParam "fieldSelector" Text :> QueryParam "watch" Bool :> QueryParam "resourceVersion" Text :> QueryParam "timeoutSeconds" Integer :> Get '[JSON] Json.WatchEvent -- watchNamespacedPersistentVolumeClaimList
    :<|> "api" :> "v1" :> "watch" :> "namespaces" :> Capture "namespace" Text :> "persistentvolumeclaims" :> Capture "name" Text :> QueryParam "pretty" Text :> QueryParam "labelSelector" Text :> QueryParam "fieldSelector" Text :> QueryParam "watch" Bool :> QueryParam "resourceVersion" Text :> QueryParam "timeoutSeconds" Integer :> Get '[JSON] Json.WatchEvent -- watchNamespacedPersistentVolumeClaim
    :<|> "api" :> "v1" :> "watch" :> "namespaces" :> Capture "namespace" Text :> "pods" :> QueryParam "pretty" Text :> QueryParam "labelSelector" Text :> QueryParam "fieldSelector" Text :> QueryParam "watch" Bool :> QueryParam "resourceVersion" Text :> QueryParam "timeoutSeconds" Integer :> Get '[JSON] Json.WatchEvent -- watchNamespacedPodList
    :<|> "api" :> "v1" :> "watch" :> "namespaces" :> Capture "namespace" Text :> "pods" :> Capture "name" Text :> QueryParam "pretty" Text :> QueryParam "labelSelector" Text :> QueryParam "fieldSelector" Text :> QueryParam "watch" Bool :> QueryParam "resourceVersion" Text :> QueryParam "timeoutSeconds" Integer :> Get '[JSON] Json.WatchEvent -- watchNamespacedPod
    :<|> "api" :> "v1" :> "watch" :> "namespaces" :> Capture "namespace" Text :> "podtemplates" :> QueryParam "pretty" Text :> QueryParam "labelSelector" Text :> QueryParam "fieldSelector" Text :> QueryParam "watch" Bool :> QueryParam "resourceVersion" Text :> QueryParam "timeoutSeconds" Integer :> Get '[JSON] Json.WatchEvent -- watchNamespacedPodTemplateList
    :<|> "api" :> "v1" :> "watch" :> "namespaces" :> Capture "namespace" Text :> "podtemplates" :> Capture "name" Text :> QueryParam "pretty" Text :> QueryParam "labelSelector" Text :> QueryParam "fieldSelector" Text :> QueryParam "watch" Bool :> QueryParam "resourceVersion" Text :> QueryParam "timeoutSeconds" Integer :> Get '[JSON] Json.WatchEvent -- watchNamespacedPodTemplate
    :<|> "api" :> "v1" :> "watch" :> "namespaces" :> Capture "namespace" Text :> "replicationcontrollers" :> QueryParam "pretty" Text :> QueryParam "labelSelector" Text :> QueryParam "fieldSelector" Text :> QueryParam "watch" Bool :> QueryParam "resourceVersion" Text :> QueryParam "timeoutSeconds" Integer :> Get '[JSON] Json.WatchEvent -- watchNamespacedReplicationControllerList
    :<|> "api" :> "v1" :> "watch" :> "namespaces" :> Capture "namespace" Text :> "replicationcontrollers" :> Capture "name" Text :> QueryParam "pretty" Text :> QueryParam "labelSelector" Text :> QueryParam "fieldSelector" Text :> QueryParam "watch" Bool :> QueryParam "resourceVersion" Text :> QueryParam "timeoutSeconds" Integer :> Get '[JSON] Json.WatchEvent -- watchNamespacedReplicationController
    :<|> "api" :> "v1" :> "watch" :> "namespaces" :> Capture "namespace" Text :> "resourcequotas" :> QueryParam "pretty" Text :> QueryParam "labelSelector" Text :> QueryParam "fieldSelector" Text :> QueryParam "watch" Bool :> QueryParam "resourceVersion" Text :> QueryParam "timeoutSeconds" Integer :> Get '[JSON] Json.WatchEvent -- watchNamespacedResourceQuotaList
    :<|> "api" :> "v1" :> "watch" :> "namespaces" :> Capture "namespace" Text :> "resourcequotas" :> Capture "name" Text :> QueryParam "pretty" Text :> QueryParam "labelSelector" Text :> QueryParam "fieldSelector" Text :> QueryParam "watch" Bool :> QueryParam "resourceVersion" Text :> QueryParam "timeoutSeconds" Integer :> Get '[JSON] Json.WatchEvent -- watchNamespacedResourceQuota
    :<|> "api" :> "v1" :> "watch" :> "namespaces" :> Capture "namespace" Text :> "secrets" :> QueryParam "pretty" Text :> QueryParam "labelSelector" Text :> QueryParam "fieldSelector" Text :> QueryParam "watch" Bool :> QueryParam "resourceVersion" Text :> QueryParam "timeoutSeconds" Integer :> Get '[JSON] Json.WatchEvent -- watchNamespacedSecretList
    :<|> "api" :> "v1" :> "watch" :> "namespaces" :> Capture "namespace" Text :> "secrets" :> Capture "name" Text :> QueryParam "pretty" Text :> QueryParam "labelSelector" Text :> QueryParam "fieldSelector" Text :> QueryParam "watch" Bool :> QueryParam "resourceVersion" Text :> QueryParam "timeoutSeconds" Integer :> Get '[JSON] Json.WatchEvent -- watchNamespacedSecret
    :<|> "api" :> "v1" :> "watch" :> "namespaces" :> Capture "namespace" Text :> "serviceaccounts" :> QueryParam "pretty" Text :> QueryParam "labelSelector" Text :> QueryParam "fieldSelector" Text :> QueryParam "watch" Bool :> QueryParam "resourceVersion" Text :> QueryParam "timeoutSeconds" Integer :> Get '[JSON] Json.WatchEvent -- watchNamespacedServiceAccountList
    :<|> "api" :> "v1" :> "watch" :> "namespaces" :> Capture "namespace" Text :> "serviceaccounts" :> Capture "name" Text :> QueryParam "pretty" Text :> QueryParam "labelSelector" Text :> QueryParam "fieldSelector" Text :> QueryParam "watch" Bool :> QueryParam "resourceVersion" Text :> QueryParam "timeoutSeconds" Integer :> Get '[JSON] Json.WatchEvent -- watchNamespacedServiceAccount
    :<|> "api" :> "v1" :> "watch" :> "namespaces" :> Capture "namespace" Text :> "services" :> QueryParam "pretty" Text :> QueryParam "labelSelector" Text :> QueryParam "fieldSelector" Text :> QueryParam "watch" Bool :> QueryParam "resourceVersion" Text :> QueryParam "timeoutSeconds" Integer :> Get '[JSON] Json.WatchEvent -- watchNamespacedServiceList
    :<|> "api" :> "v1" :> "watch" :> "namespaces" :> Capture "namespace" Text :> "services" :> Capture "name" Text :> QueryParam "pretty" Text :> QueryParam "labelSelector" Text :> QueryParam "fieldSelector" Text :> QueryParam "watch" Bool :> QueryParam "resourceVersion" Text :> QueryParam "timeoutSeconds" Integer :> Get '[JSON] Json.WatchEvent -- watchNamespacedService
    :<|> "api" :> "v1" :> "watch" :> "namespaces" :> Capture "name" Text :> QueryParam "pretty" Text :> QueryParam "labelSelector" Text :> QueryParam "fieldSelector" Text :> QueryParam "watch" Bool :> QueryParam "resourceVersion" Text :> QueryParam "timeoutSeconds" Integer :> Get '[JSON] Json.WatchEvent -- watchNamespacedNamespace
    :<|> "api" :> "v1" :> "watch" :> "nodes" :> QueryParam "pretty" Text :> QueryParam "labelSelector" Text :> QueryParam "fieldSelector" Text :> QueryParam "watch" Bool :> QueryParam "resourceVersion" Text :> QueryParam "timeoutSeconds" Integer :> Get '[JSON] Json.WatchEvent -- watchNamespacedNodeList
    :<|> "api" :> "v1" :> "watch" :> "nodes" :> Capture "name" Text :> QueryParam "pretty" Text :> QueryParam "labelSelector" Text :> QueryParam "fieldSelector" Text :> QueryParam "watch" Bool :> QueryParam "resourceVersion" Text :> QueryParam "timeoutSeconds" Integer :> Get '[JSON] Json.WatchEvent -- watchNamespacedNode
    :<|> "api" :> "v1" :> "watch" :> "persistentvolumeclaims" :> QueryParam "pretty" Text :> QueryParam "labelSelector" Text :> QueryParam "fieldSelector" Text :> QueryParam "watch" Bool :> QueryParam "resourceVersion" Text :> QueryParam "timeoutSeconds" Integer :> Get '[JSON] Json.WatchEvent -- watchPersistentVolumeClaimList
    :<|> "api" :> "v1" :> "watch" :> "persistentvolumes" :> QueryParam "pretty" Text :> QueryParam "labelSelector" Text :> QueryParam "fieldSelector" Text :> QueryParam "watch" Bool :> QueryParam "resourceVersion" Text :> QueryParam "timeoutSeconds" Integer :> Get '[JSON] Json.WatchEvent -- watchNamespacedPersistentVolumeList
    :<|> "api" :> "v1" :> "watch" :> "persistentvolumes" :> Capture "name" Text :> QueryParam "pretty" Text :> QueryParam "labelSelector" Text :> QueryParam "fieldSelector" Text :> QueryParam "watch" Bool :> QueryParam "resourceVersion" Text :> QueryParam "timeoutSeconds" Integer :> Get '[JSON] Json.WatchEvent -- watchNamespacedPersistentVolume
    :<|> "api" :> "v1" :> "watch" :> "pods" :> QueryParam "pretty" Text :> QueryParam "labelSelector" Text :> QueryParam "fieldSelector" Text :> QueryParam "watch" Bool :> QueryParam "resourceVersion" Text :> QueryParam "timeoutSeconds" Integer :> Get '[JSON] Json.WatchEvent -- watchPodList
    :<|> "api" :> "v1" :> "watch" :> "podtemplates" :> QueryParam "pretty" Text :> QueryParam "labelSelector" Text :> QueryParam "fieldSelector" Text :> QueryParam "watch" Bool :> QueryParam "resourceVersion" Text :> QueryParam "timeoutSeconds" Integer :> Get '[JSON] Json.WatchEvent -- watchPodTemplateList
    :<|> "api" :> "v1" :> "watch" :> "replicationcontrollers" :> QueryParam "pretty" Text :> QueryParam "labelSelector" Text :> QueryParam "fieldSelector" Text :> QueryParam "watch" Bool :> QueryParam "resourceVersion" Text :> QueryParam "timeoutSeconds" Integer :> Get '[JSON] Json.WatchEvent -- watchReplicationControllerList
    :<|> "api" :> "v1" :> "watch" :> "resourcequotas" :> QueryParam "pretty" Text :> QueryParam "labelSelector" Text :> QueryParam "fieldSelector" Text :> QueryParam "watch" Bool :> QueryParam "resourceVersion" Text :> QueryParam "timeoutSeconds" Integer :> Get '[JSON] Json.WatchEvent -- watchResourceQuotaList
    :<|> "api" :> "v1" :> "watch" :> "secrets" :> QueryParam "pretty" Text :> QueryParam "labelSelector" Text :> QueryParam "fieldSelector" Text :> QueryParam "watch" Bool :> QueryParam "resourceVersion" Text :> QueryParam "timeoutSeconds" Integer :> Get '[JSON] Json.WatchEvent -- watchSecretList
    :<|> "api" :> "v1" :> "watch" :> "serviceaccounts" :> QueryParam "pretty" Text :> QueryParam "labelSelector" Text :> QueryParam "fieldSelector" Text :> QueryParam "watch" Bool :> QueryParam "resourceVersion" Text :> QueryParam "timeoutSeconds" Integer :> Get '[JSON] Json.WatchEvent -- watchServiceAccountList
    :<|> "api" :> "v1" :> "watch" :> "services" :> QueryParam "pretty" Text :> QueryParam "labelSelector" Text :> QueryParam "fieldSelector" Text :> QueryParam "watch" Bool :> QueryParam "resourceVersion" Text :> QueryParam "timeoutSeconds" Integer :> Get '[JSON] Json.WatchEvent -- watchServiceList

proxyApivApi :: Proxy ApivApi
proxyApivApi = Proxy


serverPath :: String
serverPath = "https://10.10.10.10:6443/"

parseHostPort :: String -> (String, Int)
parseHostPort path = (host,port)
    where
        authority = case parseURI path of
            Just x -> uriAuthority x
            _      -> Nothing
        (host, port) = case authority of
            Just y -> (uriRegName y, (getPort . uriPort) y)
            _      -> ("localhost", 8080)
        getPort p = case (length p) of
            0 -> 80
            _ -> (read . drop 1) p

(host, port) = parseHostPort serverPath

getAPIResources
    :<|> listNamespacedComponentStatus
    :<|> readNamespacedComponentStatus
    :<|> listConfigMap
    :<|> listEndpoints
    :<|> listEvent
    :<|> listLimitRange
    :<|> listNamespacedNamespace
    :<|> createNamespacedNamespace
    :<|> deletecollectionNamespacedNamespace
    :<|> createNamespacedBinding
    :<|> listNamespacedConfigMap
    :<|> createNamespacedConfigMap
    :<|> deletecollectionNamespacedConfigMap
    :<|> readNamespacedConfigMap
    :<|> replaceNamespacedConfigMap
    :<|> deleteNamespacedConfigMap
    :<|> patchNamespacedConfigMap
    :<|> listNamespacedEndpoints
    :<|> createNamespacedEndpoints
    :<|> deletecollectionNamespacedEndpoints
    :<|> readNamespacedEndpoints
    :<|> replaceNamespacedEndpoints
    :<|> deleteNamespacedEndpoints
    :<|> patchNamespacedEndpoints
    :<|> listNamespacedEvent
    :<|> createNamespacedEvent
    :<|> deletecollectionNamespacedEvent
    :<|> readNamespacedEvent
    :<|> replaceNamespacedEvent
    :<|> deleteNamespacedEvent
    :<|> patchNamespacedEvent
    :<|> listNamespacedLimitRange
    :<|> createNamespacedLimitRange
    :<|> deletecollectionNamespacedLimitRange
    :<|> readNamespacedLimitRange
    :<|> replaceNamespacedLimitRange
    :<|> deleteNamespacedLimitRange
    :<|> patchNamespacedLimitRange
    :<|> listNamespacedPersistentVolumeClaim
    :<|> createNamespacedPersistentVolumeClaim
    :<|> deletecollectionNamespacedPersistentVolumeClaim
    :<|> readNamespacedPersistentVolumeClaim
    :<|> replaceNamespacedPersistentVolumeClaim
    :<|> deleteNamespacedPersistentVolumeClaim
    :<|> patchNamespacedPersistentVolumeClaim
    :<|> replaceNamespacedPersistentVolumeClaimStatus
    :<|> listNamespacedPod
    :<|> createNamespacedPod
    :<|> deletecollectionNamespacedPod
    :<|> readNamespacedPod
    :<|> replaceNamespacedPod
    :<|> deleteNamespacedPod
    :<|> patchNamespacedPod
    :<|> connectGetNamespacedPodAttach
    :<|> connectPostNamespacedPodAttach
    :<|> createNamespacedBindingBinding
    :<|> connectGetNamespacedPodExec
    :<|> connectPostNamespacedPodExec
    :<|> readNamespacedPodLog
    :<|> connectGetNamespacedPodPortforward
    :<|> connectPostNamespacedPodPortforward
    :<|> connectGetNamespacedPodProxy
    :<|> connectHeadNamespacedPodProxy
    :<|> connectPutNamespacedPodProxy
    :<|> connectPostNamespacedPodProxy
    :<|> connectDeleteNamespacedPodProxy
    :<|> connectOptionsNamespacedPodProxy
    :<|> connectGetNamespacedPodProxy_0
    :<|> connectHeadNamespacedPodProxy_0
    :<|> connectPutNamespacedPodProxy_0
    :<|> connectPostNamespacedPodProxy_0
    :<|> connectDeleteNamespacedPodProxy_0
    :<|> connectOptionsNamespacedPodProxy_0
    :<|> replaceNamespacedPodStatus
    :<|> listNamespacedPodTemplate
    :<|> createNamespacedPodTemplate
    :<|> deletecollectionNamespacedPodTemplate
    :<|> readNamespacedPodTemplate
    :<|> replaceNamespacedPodTemplate
    :<|> deleteNamespacedPodTemplate
    :<|> patchNamespacedPodTemplate
    :<|> listNamespacedReplicationController
    :<|> createNamespacedReplicationController
    :<|> deletecollectionNamespacedReplicationController
    :<|> readNamespacedReplicationController
    :<|> replaceNamespacedReplicationController
    :<|> deleteNamespacedReplicationController
    :<|> patchNamespacedReplicationController
    :<|> replaceNamespacedReplicationControllerStatus
    :<|> listNamespacedResourceQuota
    :<|> createNamespacedResourceQuota
    :<|> deletecollectionNamespacedResourceQuota
    :<|> readNamespacedResourceQuota
    :<|> replaceNamespacedResourceQuota
    :<|> deleteNamespacedResourceQuota
    :<|> patchNamespacedResourceQuota
    :<|> replaceNamespacedResourceQuotaStatus
    :<|> listNamespacedSecret
    :<|> createNamespacedSecret
    :<|> deletecollectionNamespacedSecret
    :<|> readNamespacedSecret
    :<|> replaceNamespacedSecret
    :<|> deleteNamespacedSecret
    :<|> patchNamespacedSecret
    :<|> listNamespacedServiceAccount
    :<|> createNamespacedServiceAccount
    :<|> deletecollectionNamespacedServiceAccount
    :<|> readNamespacedServiceAccount
    :<|> replaceNamespacedServiceAccount
    :<|> deleteNamespacedServiceAccount
    :<|> patchNamespacedServiceAccount
    :<|> listNamespacedService
    :<|> createNamespacedService
    :<|> readNamespacedService
    :<|> replaceNamespacedService
    :<|> deleteNamespacedService
    :<|> patchNamespacedService
    :<|> replaceNamespacedServiceStatus
    :<|> readNamespacedNamespace
    :<|> replaceNamespacedNamespace
    :<|> deleteNamespacedNamespace
    :<|> patchNamespacedNamespace
    :<|> replaceNamespacedNamespaceFinalize
    :<|> replaceNamespacedNamespaceStatus
    :<|> listNamespacedNode
    :<|> createNamespacedNode
    :<|> deletecollectionNamespacedNode
    :<|> readNamespacedNode
    :<|> replaceNamespacedNode
    :<|> deleteNamespacedNode
    :<|> patchNamespacedNode
    :<|> replaceNamespacedNodeStatus
    :<|> listPersistentVolumeClaim
    :<|> listNamespacedPersistentVolume
    :<|> createNamespacedPersistentVolume
    :<|> deletecollectionNamespacedPersistentVolume
    :<|> readNamespacedPersistentVolume
    :<|> replaceNamespacedPersistentVolume
    :<|> deleteNamespacedPersistentVolume
    :<|> patchNamespacedPersistentVolume
    :<|> replaceNamespacedPersistentVolumeStatus
    :<|> listPod
    :<|> listPodTemplate
    :<|> proxyGETNamespacedPod
    :<|> proxyHEADNamespacedPod
    :<|> proxyPUTNamespacedPod
    :<|> proxyPOSTNamespacedPod
    :<|> proxyDELETENamespacedPod
    :<|> proxyOPTIONSNamespacedPod
    :<|> proxyGETNamespacedPod_0
    :<|> proxyHEADNamespacedPod_0
    :<|> proxyPUTNamespacedPod_0
    :<|> proxyPOSTNamespacedPod_0
    :<|> proxyDELETENamespacedPod_0
    :<|> proxyOPTIONSNamespacedPod_0
    :<|> proxyGETNamespacedService
    :<|> proxyHEADNamespacedService
    :<|> proxyPUTNamespacedService
    :<|> proxyPOSTNamespacedService
    :<|> proxyDELETENamespacedService
    :<|> proxyOPTIONSNamespacedService
    :<|> proxyGETNamespacedService_0
    :<|> proxyHEADNamespacedService_0
    :<|> proxyPUTNamespacedService_0
    :<|> proxyPOSTNamespacedService_0
    :<|> proxyDELETENamespacedService_0
    :<|> proxyOPTIONSNamespacedService_0
    :<|> proxyGETNamespacedNode
    :<|> proxyHEADNamespacedNode
    :<|> proxyPUTNamespacedNode
    :<|> proxyPOSTNamespacedNode
    :<|> proxyDELETENamespacedNode
    :<|> proxyOPTIONSNamespacedNode
    :<|> proxyGETNamespacedNode_0
    :<|> proxyHEADNamespacedNode_0
    :<|> proxyPUTNamespacedNode_0
    :<|> proxyPOSTNamespacedNode_0
    :<|> proxyDELETENamespacedNode_0
    :<|> proxyOPTIONSNamespacedNode_0
    :<|> listReplicationController
    :<|> listResourceQuota
    :<|> listSecret
    :<|> listServiceAccount
    :<|> listService
    :<|> watchConfigMapList
    :<|> watchEndpointsList
    :<|> watchEventList
    :<|> watchLimitRangeList
    :<|> watchNamespacedNamespaceList
    :<|> watchNamespacedConfigMapList
    :<|> watchNamespacedConfigMap
    :<|> watchNamespacedEndpointsList
    :<|> watchNamespacedEndpoints
    :<|> watchNamespacedEventList
    :<|> watchNamespacedEvent
    :<|> watchNamespacedLimitRangeList
    :<|> watchNamespacedLimitRange
    :<|> watchNamespacedPersistentVolumeClaimList
    :<|> watchNamespacedPersistentVolumeClaim
    :<|> watchNamespacedPodList
    :<|> watchNamespacedPod
    :<|> watchNamespacedPodTemplateList
    :<|> watchNamespacedPodTemplate
    :<|> watchNamespacedReplicationControllerList
    :<|> watchNamespacedReplicationController
    :<|> watchNamespacedResourceQuotaList
    :<|> watchNamespacedResourceQuota
    :<|> watchNamespacedSecretList
    :<|> watchNamespacedSecret
    :<|> watchNamespacedServiceAccountList
    :<|> watchNamespacedServiceAccount
    :<|> watchNamespacedServiceList
    :<|> watchNamespacedService
    :<|> watchNamespacedNamespace
    :<|> watchNamespacedNodeList
    :<|> watchNamespacedNode
    :<|> watchPersistentVolumeClaimList
    :<|> watchNamespacedPersistentVolumeList
    :<|> watchNamespacedPersistentVolume
    :<|> watchPodList
    :<|> watchPodTemplateList
    :<|> watchReplicationControllerList
    :<|> watchResourceQuotaList
    :<|> watchSecretList
    :<|> watchServiceAccountList
    :<|> watchServiceList
    = client proxyApivApi $ BaseUrl Http host port
