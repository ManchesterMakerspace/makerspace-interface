# Copyright 2015 Google Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

require 'date'
require 'google/apis/core/base_service'
require 'google/apis/core/json_representation'
require 'google/apis/core/hashable'
require 'google/apis/errors'

module Google
  module Apis
    module ServiceuserV1
      
      class OAuthRequirements
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Usage
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Context
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class LogDescriptor
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class MonitoredResourceDescriptor
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class CustomErrorRule
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class MediaDownload
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class CustomAuthRequirements
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class DisableServiceRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class SearchServicesResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class MediaUpload
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class UsageRule
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class AuthRequirement
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Documentation
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class BackendRule
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class AuthenticationRule
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Api
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class MetricRule
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Authentication
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Operation
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Page
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Status
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class AuthProvider
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Service
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class EnumValue
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class OperationMetadata
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class CustomHttpPattern
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class SystemParameterRule
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class PublishedService
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class HttpRule
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class VisibilityRule
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class MonitoringDestination
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Visibility
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class SystemParameters
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Quota
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Step
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class LoggingDestination
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Option
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Logging
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class QuotaLimit
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class MethodProp
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Mixin
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class CustomError
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Http
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class SourceInfo
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Control
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class SystemParameter
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Field
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Monitoring
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Enum
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class LabelDescriptor
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class EnableServiceRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Type
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Experimental
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Backend
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class DocumentationRule
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class AuthorizationConfig
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ContextRule
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class MetricDescriptor
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class SourceContext
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Endpoint
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ListEnabledServicesResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class OAuthRequirements
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :canonical_scopes, as: 'canonicalScopes'
        end
      end
      
      class Usage
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :producer_notification_channel, as: 'producerNotificationChannel'
          collection :rules, as: 'rules', class: Google::Apis::ServiceuserV1::UsageRule, decorator: Google::Apis::ServiceuserV1::UsageRule::Representation
      
          collection :requirements, as: 'requirements'
        end
      end
      
      class Context
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :rules, as: 'rules', class: Google::Apis::ServiceuserV1::ContextRule, decorator: Google::Apis::ServiceuserV1::ContextRule::Representation
      
        end
      end
      
      class LogDescriptor
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :labels, as: 'labels', class: Google::Apis::ServiceuserV1::LabelDescriptor, decorator: Google::Apis::ServiceuserV1::LabelDescriptor::Representation
      
          property :name, as: 'name'
          property :description, as: 'description'
          property :display_name, as: 'displayName'
        end
      end
      
      class MonitoredResourceDescriptor
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :labels, as: 'labels', class: Google::Apis::ServiceuserV1::LabelDescriptor, decorator: Google::Apis::ServiceuserV1::LabelDescriptor::Representation
      
          property :name, as: 'name'
          property :display_name, as: 'displayName'
          property :description, as: 'description'
          property :type, as: 'type'
        end
      end
      
      class CustomErrorRule
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :is_error_type, as: 'isErrorType'
          property :selector, as: 'selector'
        end
      end
      
      class MediaDownload
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :use_direct_download, as: 'useDirectDownload'
          property :enabled, as: 'enabled'
          property :download_service, as: 'downloadService'
          property :complete_notification, as: 'completeNotification'
          property :max_direct_download_size, :numeric_string => true, as: 'maxDirectDownloadSize'
          property :dropzone, as: 'dropzone'
        end
      end
      
      class CustomAuthRequirements
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :provider, as: 'provider'
        end
      end
      
      class DisableServiceRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
        end
      end
      
      class SearchServicesResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :services, as: 'services', class: Google::Apis::ServiceuserV1::PublishedService, decorator: Google::Apis::ServiceuserV1::PublishedService::Representation
      
          property :next_page_token, as: 'nextPageToken'
        end
      end
      
      class MediaUpload
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :start_notification, as: 'startNotification'
          property :upload_service, as: 'uploadService'
          property :max_size, :numeric_string => true, as: 'maxSize'
          collection :mime_types, as: 'mimeTypes'
          property :complete_notification, as: 'completeNotification'
          property :progress_notification, as: 'progressNotification'
          property :enabled, as: 'enabled'
          property :dropzone, as: 'dropzone'
        end
      end
      
      class UsageRule
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :allow_unregistered_calls, as: 'allowUnregisteredCalls'
          property :selector, as: 'selector'
        end
      end
      
      class AuthRequirement
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :audiences, as: 'audiences'
          property :provider_id, as: 'providerId'
        end
      end
      
      class Documentation
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :summary, as: 'summary'
          property :documentation_root_url, as: 'documentationRootUrl'
          collection :rules, as: 'rules', class: Google::Apis::ServiceuserV1::DocumentationRule, decorator: Google::Apis::ServiceuserV1::DocumentationRule::Representation
      
          property :overview, as: 'overview'
          collection :pages, as: 'pages', class: Google::Apis::ServiceuserV1::Page, decorator: Google::Apis::ServiceuserV1::Page::Representation
      
        end
      end
      
      class BackendRule
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :address, as: 'address'
          property :selector, as: 'selector'
          property :deadline, as: 'deadline'
          property :min_deadline, as: 'minDeadline'
        end
      end
      
      class AuthenticationRule
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :selector, as: 'selector'
          property :allow_without_credential, as: 'allowWithoutCredential'
          property :oauth, as: 'oauth', class: Google::Apis::ServiceuserV1::OAuthRequirements, decorator: Google::Apis::ServiceuserV1::OAuthRequirements::Representation
      
          property :custom_auth, as: 'customAuth', class: Google::Apis::ServiceuserV1::CustomAuthRequirements, decorator: Google::Apis::ServiceuserV1::CustomAuthRequirements::Representation
      
          collection :requirements, as: 'requirements', class: Google::Apis::ServiceuserV1::AuthRequirement, decorator: Google::Apis::ServiceuserV1::AuthRequirement::Representation
      
        end
      end
      
      class Api
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :methods_prop, as: 'methods', class: Google::Apis::ServiceuserV1::MethodProp, decorator: Google::Apis::ServiceuserV1::MethodProp::Representation
      
          property :name, as: 'name'
          property :syntax, as: 'syntax'
          property :source_context, as: 'sourceContext', class: Google::Apis::ServiceuserV1::SourceContext, decorator: Google::Apis::ServiceuserV1::SourceContext::Representation
      
          property :version, as: 'version'
          collection :mixins, as: 'mixins', class: Google::Apis::ServiceuserV1::Mixin, decorator: Google::Apis::ServiceuserV1::Mixin::Representation
      
          collection :options, as: 'options', class: Google::Apis::ServiceuserV1::Option, decorator: Google::Apis::ServiceuserV1::Option::Representation
      
        end
      end
      
      class MetricRule
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :selector, as: 'selector'
          hash :metric_costs, as: 'metricCosts'
        end
      end
      
      class Authentication
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :rules, as: 'rules', class: Google::Apis::ServiceuserV1::AuthenticationRule, decorator: Google::Apis::ServiceuserV1::AuthenticationRule::Representation
      
          collection :providers, as: 'providers', class: Google::Apis::ServiceuserV1::AuthProvider, decorator: Google::Apis::ServiceuserV1::AuthProvider::Representation
      
        end
      end
      
      class Operation
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :done, as: 'done'
          hash :response, as: 'response'
          property :name, as: 'name'
          property :error, as: 'error', class: Google::Apis::ServiceuserV1::Status, decorator: Google::Apis::ServiceuserV1::Status::Representation
      
          hash :metadata, as: 'metadata'
        end
      end
      
      class Page
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :name, as: 'name'
          property :content, as: 'content'
          collection :subpages, as: 'subpages', class: Google::Apis::ServiceuserV1::Page, decorator: Google::Apis::ServiceuserV1::Page::Representation
      
        end
      end
      
      class Status
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :message, as: 'message'
          collection :details, as: 'details'
          property :code, as: 'code'
        end
      end
      
      class AuthProvider
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :jwks_uri, as: 'jwksUri'
          property :audiences, as: 'audiences'
          property :id, as: 'id'
          property :issuer, as: 'issuer'
        end
      end
      
      class Service
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :documentation, as: 'documentation', class: Google::Apis::ServiceuserV1::Documentation, decorator: Google::Apis::ServiceuserV1::Documentation::Representation
      
          collection :monitored_resources, as: 'monitoredResources', class: Google::Apis::ServiceuserV1::MonitoredResourceDescriptor, decorator: Google::Apis::ServiceuserV1::MonitoredResourceDescriptor::Representation
      
          property :logging, as: 'logging', class: Google::Apis::ServiceuserV1::Logging, decorator: Google::Apis::ServiceuserV1::Logging::Representation
      
          property :context, as: 'context', class: Google::Apis::ServiceuserV1::Context, decorator: Google::Apis::ServiceuserV1::Context::Representation
      
          collection :enums, as: 'enums', class: Google::Apis::ServiceuserV1::Enum, decorator: Google::Apis::ServiceuserV1::Enum::Representation
      
          property :id, as: 'id'
          property :usage, as: 'usage', class: Google::Apis::ServiceuserV1::Usage, decorator: Google::Apis::ServiceuserV1::Usage::Representation
      
          collection :metrics, as: 'metrics', class: Google::Apis::ServiceuserV1::MetricDescriptor, decorator: Google::Apis::ServiceuserV1::MetricDescriptor::Representation
      
          property :authentication, as: 'authentication', class: Google::Apis::ServiceuserV1::Authentication, decorator: Google::Apis::ServiceuserV1::Authentication::Representation
      
          property :experimental, as: 'experimental', class: Google::Apis::ServiceuserV1::Experimental, decorator: Google::Apis::ServiceuserV1::Experimental::Representation
      
          property :control, as: 'control', class: Google::Apis::ServiceuserV1::Control, decorator: Google::Apis::ServiceuserV1::Control::Representation
      
          property :config_version, as: 'configVersion'
          property :monitoring, as: 'monitoring', class: Google::Apis::ServiceuserV1::Monitoring, decorator: Google::Apis::ServiceuserV1::Monitoring::Representation
      
          collection :system_types, as: 'systemTypes', class: Google::Apis::ServiceuserV1::Type, decorator: Google::Apis::ServiceuserV1::Type::Representation
      
          property :producer_project_id, as: 'producerProjectId'
          property :visibility, as: 'visibility', class: Google::Apis::ServiceuserV1::Visibility, decorator: Google::Apis::ServiceuserV1::Visibility::Representation
      
          property :quota, as: 'quota', class: Google::Apis::ServiceuserV1::Quota, decorator: Google::Apis::ServiceuserV1::Quota::Representation
      
          property :name, as: 'name'
          property :custom_error, as: 'customError', class: Google::Apis::ServiceuserV1::CustomError, decorator: Google::Apis::ServiceuserV1::CustomError::Representation
      
          property :title, as: 'title'
          collection :endpoints, as: 'endpoints', class: Google::Apis::ServiceuserV1::Endpoint, decorator: Google::Apis::ServiceuserV1::Endpoint::Representation
      
          collection :logs, as: 'logs', class: Google::Apis::ServiceuserV1::LogDescriptor, decorator: Google::Apis::ServiceuserV1::LogDescriptor::Representation
      
          collection :apis, as: 'apis', class: Google::Apis::ServiceuserV1::Api, decorator: Google::Apis::ServiceuserV1::Api::Representation
      
          collection :types, as: 'types', class: Google::Apis::ServiceuserV1::Type, decorator: Google::Apis::ServiceuserV1::Type::Representation
      
          property :source_info, as: 'sourceInfo', class: Google::Apis::ServiceuserV1::SourceInfo, decorator: Google::Apis::ServiceuserV1::SourceInfo::Representation
      
          property :http, as: 'http', class: Google::Apis::ServiceuserV1::Http, decorator: Google::Apis::ServiceuserV1::Http::Representation
      
          property :backend, as: 'backend', class: Google::Apis::ServiceuserV1::Backend, decorator: Google::Apis::ServiceuserV1::Backend::Representation
      
          property :system_parameters, as: 'systemParameters', class: Google::Apis::ServiceuserV1::SystemParameters, decorator: Google::Apis::ServiceuserV1::SystemParameters::Representation
      
        end
      end
      
      class EnumValue
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :name, as: 'name'
          collection :options, as: 'options', class: Google::Apis::ServiceuserV1::Option, decorator: Google::Apis::ServiceuserV1::Option::Representation
      
          property :number, as: 'number'
        end
      end
      
      class OperationMetadata
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :start_time, as: 'startTime'
          collection :resource_names, as: 'resourceNames'
          collection :steps, as: 'steps', class: Google::Apis::ServiceuserV1::Step, decorator: Google::Apis::ServiceuserV1::Step::Representation
      
          property :progress_percentage, as: 'progressPercentage'
        end
      end
      
      class CustomHttpPattern
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :path, as: 'path'
          property :kind, as: 'kind'
        end
      end
      
      class SystemParameterRule
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :selector, as: 'selector'
          collection :parameters, as: 'parameters', class: Google::Apis::ServiceuserV1::SystemParameter, decorator: Google::Apis::ServiceuserV1::SystemParameter::Representation
      
        end
      end
      
      class PublishedService
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :service, as: 'service', class: Google::Apis::ServiceuserV1::Service, decorator: Google::Apis::ServiceuserV1::Service::Representation
      
          property :name, as: 'name'
        end
      end
      
      class HttpRule
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :selector, as: 'selector'
          property :custom, as: 'custom', class: Google::Apis::ServiceuserV1::CustomHttpPattern, decorator: Google::Apis::ServiceuserV1::CustomHttpPattern::Representation
      
          property :patch, as: 'patch'
          property :get, as: 'get'
          property :put, as: 'put'
          property :delete, as: 'delete'
          property :body, as: 'body'
          property :post, as: 'post'
          property :media_download, as: 'mediaDownload', class: Google::Apis::ServiceuserV1::MediaDownload, decorator: Google::Apis::ServiceuserV1::MediaDownload::Representation
      
          property :rest_method_name, as: 'restMethodName'
          collection :additional_bindings, as: 'additionalBindings', class: Google::Apis::ServiceuserV1::HttpRule, decorator: Google::Apis::ServiceuserV1::HttpRule::Representation
      
          property :response_body, as: 'responseBody'
          property :rest_collection, as: 'restCollection'
          property :media_upload, as: 'mediaUpload', class: Google::Apis::ServiceuserV1::MediaUpload, decorator: Google::Apis::ServiceuserV1::MediaUpload::Representation
      
        end
      end
      
      class VisibilityRule
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :restriction, as: 'restriction'
          property :selector, as: 'selector'
        end
      end
      
      class MonitoringDestination
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :monitored_resource, as: 'monitoredResource'
          collection :metrics, as: 'metrics'
        end
      end
      
      class Visibility
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :rules, as: 'rules', class: Google::Apis::ServiceuserV1::VisibilityRule, decorator: Google::Apis::ServiceuserV1::VisibilityRule::Representation
      
        end
      end
      
      class SystemParameters
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :rules, as: 'rules', class: Google::Apis::ServiceuserV1::SystemParameterRule, decorator: Google::Apis::ServiceuserV1::SystemParameterRule::Representation
      
        end
      end
      
      class Quota
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :limits, as: 'limits', class: Google::Apis::ServiceuserV1::QuotaLimit, decorator: Google::Apis::ServiceuserV1::QuotaLimit::Representation
      
          collection :metric_rules, as: 'metricRules', class: Google::Apis::ServiceuserV1::MetricRule, decorator: Google::Apis::ServiceuserV1::MetricRule::Representation
      
        end
      end
      
      class Step
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :description, as: 'description'
          property :status, as: 'status'
        end
      end
      
      class LoggingDestination
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :logs, as: 'logs'
          property :monitored_resource, as: 'monitoredResource'
        end
      end
      
      class Option
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          hash :value, as: 'value'
          property :name, as: 'name'
        end
      end
      
      class Logging
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :consumer_destinations, as: 'consumerDestinations', class: Google::Apis::ServiceuserV1::LoggingDestination, decorator: Google::Apis::ServiceuserV1::LoggingDestination::Representation
      
          collection :producer_destinations, as: 'producerDestinations', class: Google::Apis::ServiceuserV1::LoggingDestination, decorator: Google::Apis::ServiceuserV1::LoggingDestination::Representation
      
        end
      end
      
      class QuotaLimit
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :duration, as: 'duration'
          property :free_tier, :numeric_string => true, as: 'freeTier'
          property :default_limit, :numeric_string => true, as: 'defaultLimit'
          property :metric, as: 'metric'
          property :display_name, as: 'displayName'
          property :description, as: 'description'
          hash :values, as: 'values'
          property :unit, as: 'unit'
          property :max_limit, :numeric_string => true, as: 'maxLimit'
          property :name, as: 'name'
        end
      end
      
      class MethodProp
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :response_streaming, as: 'responseStreaming'
          property :name, as: 'name'
          property :request_type_url, as: 'requestTypeUrl'
          property :request_streaming, as: 'requestStreaming'
          property :syntax, as: 'syntax'
          property :response_type_url, as: 'responseTypeUrl'
          collection :options, as: 'options', class: Google::Apis::ServiceuserV1::Option, decorator: Google::Apis::ServiceuserV1::Option::Representation
      
        end
      end
      
      class Mixin
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :name, as: 'name'
          property :root, as: 'root'
        end
      end
      
      class CustomError
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :types, as: 'types'
          collection :rules, as: 'rules', class: Google::Apis::ServiceuserV1::CustomErrorRule, decorator: Google::Apis::ServiceuserV1::CustomErrorRule::Representation
      
        end
      end
      
      class Http
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :rules, as: 'rules', class: Google::Apis::ServiceuserV1::HttpRule, decorator: Google::Apis::ServiceuserV1::HttpRule::Representation
      
          property :fully_decode_reserved_expansion, as: 'fullyDecodeReservedExpansion'
        end
      end
      
      class SourceInfo
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :source_files, as: 'sourceFiles'
        end
      end
      
      class Control
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :environment, as: 'environment'
        end
      end
      
      class SystemParameter
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :url_query_parameter, as: 'urlQueryParameter'
          property :http_header, as: 'httpHeader'
          property :name, as: 'name'
        end
      end
      
      class Field
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :oneof_index, as: 'oneofIndex'
          property :cardinality, as: 'cardinality'
          property :packed, as: 'packed'
          property :default_value, as: 'defaultValue'
          property :name, as: 'name'
          property :type_url, as: 'typeUrl'
          property :number, as: 'number'
          property :kind, as: 'kind'
          property :json_name, as: 'jsonName'
          collection :options, as: 'options', class: Google::Apis::ServiceuserV1::Option, decorator: Google::Apis::ServiceuserV1::Option::Representation
      
        end
      end
      
      class Monitoring
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :consumer_destinations, as: 'consumerDestinations', class: Google::Apis::ServiceuserV1::MonitoringDestination, decorator: Google::Apis::ServiceuserV1::MonitoringDestination::Representation
      
          collection :producer_destinations, as: 'producerDestinations', class: Google::Apis::ServiceuserV1::MonitoringDestination, decorator: Google::Apis::ServiceuserV1::MonitoringDestination::Representation
      
        end
      end
      
      class Enum
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :name, as: 'name'
          collection :enumvalue, as: 'enumvalue', class: Google::Apis::ServiceuserV1::EnumValue, decorator: Google::Apis::ServiceuserV1::EnumValue::Representation
      
          collection :options, as: 'options', class: Google::Apis::ServiceuserV1::Option, decorator: Google::Apis::ServiceuserV1::Option::Representation
      
          property :source_context, as: 'sourceContext', class: Google::Apis::ServiceuserV1::SourceContext, decorator: Google::Apis::ServiceuserV1::SourceContext::Representation
      
          property :syntax, as: 'syntax'
        end
      end
      
      class LabelDescriptor
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :key, as: 'key'
          property :description, as: 'description'
          property :value_type, as: 'valueType'
        end
      end
      
      class EnableServiceRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
        end
      end
      
      class Type
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :options, as: 'options', class: Google::Apis::ServiceuserV1::Option, decorator: Google::Apis::ServiceuserV1::Option::Representation
      
          collection :fields, as: 'fields', class: Google::Apis::ServiceuserV1::Field, decorator: Google::Apis::ServiceuserV1::Field::Representation
      
          property :name, as: 'name'
          collection :oneofs, as: 'oneofs'
          property :source_context, as: 'sourceContext', class: Google::Apis::ServiceuserV1::SourceContext, decorator: Google::Apis::ServiceuserV1::SourceContext::Representation
      
          property :syntax, as: 'syntax'
        end
      end
      
      class Experimental
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :authorization, as: 'authorization', class: Google::Apis::ServiceuserV1::AuthorizationConfig, decorator: Google::Apis::ServiceuserV1::AuthorizationConfig::Representation
      
        end
      end
      
      class Backend
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :rules, as: 'rules', class: Google::Apis::ServiceuserV1::BackendRule, decorator: Google::Apis::ServiceuserV1::BackendRule::Representation
      
        end
      end
      
      class DocumentationRule
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :deprecation_description, as: 'deprecationDescription'
          property :selector, as: 'selector'
          property :description, as: 'description'
        end
      end
      
      class AuthorizationConfig
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :provider, as: 'provider'
        end
      end
      
      class ContextRule
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :requested, as: 'requested'
          property :selector, as: 'selector'
          collection :provided, as: 'provided'
        end
      end
      
      class MetricDescriptor
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :value_type, as: 'valueType'
          property :metric_kind, as: 'metricKind'
          property :display_name, as: 'displayName'
          property :description, as: 'description'
          property :unit, as: 'unit'
          collection :labels, as: 'labels', class: Google::Apis::ServiceuserV1::LabelDescriptor, decorator: Google::Apis::ServiceuserV1::LabelDescriptor::Representation
      
          property :name, as: 'name'
          property :type, as: 'type'
        end
      end
      
      class SourceContext
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :file_name, as: 'fileName'
        end
      end
      
      class Endpoint
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :features, as: 'features'
          collection :apis, as: 'apis'
          property :allow_cors, as: 'allowCors'
          collection :aliases, as: 'aliases'
          property :target, as: 'target'
          property :name, as: 'name'
        end
      end
      
      class ListEnabledServicesResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :services, as: 'services', class: Google::Apis::ServiceuserV1::PublishedService, decorator: Google::Apis::ServiceuserV1::PublishedService::Representation
      
          property :next_page_token, as: 'nextPageToken'
        end
      end
    end
  end
end
