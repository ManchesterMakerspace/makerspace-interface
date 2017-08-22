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
    module LoggingV2
      
      class LogLine
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ListLogMetricsResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Empty
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class LogEntry
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class SourceLocation
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ListLogEntriesRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class RequestLog
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ListMonitoredResourceDescriptorsResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class SourceReference
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class WriteLogEntriesResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class LogMetric
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class LogEntryOperation
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class MonitoredResource
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class LogSink
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class WriteLogEntriesRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ListLogsResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class HttpRequest
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ListSinksResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class LabelDescriptor
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class MonitoredResourceDescriptor
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class LogEntrySourceLocation
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ListLogEntriesResponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class LogLine
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :severity, as: 'severity'
          property :log_message, as: 'logMessage'
          property :source_location, as: 'sourceLocation', class: Google::Apis::LoggingV2::SourceLocation, decorator: Google::Apis::LoggingV2::SourceLocation::Representation
      
          property :time, as: 'time'
        end
      end
      
      class ListLogMetricsResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :metrics, as: 'metrics', class: Google::Apis::LoggingV2::LogMetric, decorator: Google::Apis::LoggingV2::LogMetric::Representation
      
          property :next_page_token, as: 'nextPageToken'
        end
      end
      
      class Empty
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
        end
      end
      
      class LogEntry
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :trace, as: 'trace'
          hash :labels, as: 'labels'
          property :severity, as: 'severity'
          property :source_location, as: 'sourceLocation', class: Google::Apis::LoggingV2::LogEntrySourceLocation, decorator: Google::Apis::LoggingV2::LogEntrySourceLocation::Representation
      
          property :timestamp, as: 'timestamp'
          property :receive_timestamp, as: 'receiveTimestamp'
          property :log_name, as: 'logName'
          property :http_request, as: 'httpRequest', class: Google::Apis::LoggingV2::HttpRequest, decorator: Google::Apis::LoggingV2::HttpRequest::Representation
      
          property :resource, as: 'resource', class: Google::Apis::LoggingV2::MonitoredResource, decorator: Google::Apis::LoggingV2::MonitoredResource::Representation
      
          hash :json_payload, as: 'jsonPayload'
          property :insert_id, as: 'insertId'
          property :operation, as: 'operation', class: Google::Apis::LoggingV2::LogEntryOperation, decorator: Google::Apis::LoggingV2::LogEntryOperation::Representation
      
          property :text_payload, as: 'textPayload'
          hash :proto_payload, as: 'protoPayload'
        end
      end
      
      class SourceLocation
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :function_name, as: 'functionName'
          property :line, :numeric_string => true, as: 'line'
          property :file, as: 'file'
        end
      end
      
      class ListLogEntriesRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :page_token, as: 'pageToken'
          property :page_size, as: 'pageSize'
          property :order_by, as: 'orderBy'
          collection :resource_names, as: 'resourceNames'
          collection :project_ids, as: 'projectIds'
          property :filter, as: 'filter'
        end
      end
      
      class RequestLog
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :mega_cycles, :numeric_string => true, as: 'megaCycles'
          property :first, as: 'first'
          property :version_id, as: 'versionId'
          property :module_id, as: 'moduleId'
          property :end_time, as: 'endTime'
          property :user_agent, as: 'userAgent'
          property :was_loading_request, as: 'wasLoadingRequest'
          collection :source_reference, as: 'sourceReference', class: Google::Apis::LoggingV2::SourceReference, decorator: Google::Apis::LoggingV2::SourceReference::Representation
      
          property :response_size, :numeric_string => true, as: 'responseSize'
          property :trace_id, as: 'traceId'
          collection :line, as: 'line', class: Google::Apis::LoggingV2::LogLine, decorator: Google::Apis::LoggingV2::LogLine::Representation
      
          property :referrer, as: 'referrer'
          property :task_queue_name, as: 'taskQueueName'
          property :request_id, as: 'requestId'
          property :nickname, as: 'nickname'
          property :pending_time, as: 'pendingTime'
          property :resource, as: 'resource'
          property :status, as: 'status'
          property :task_name, as: 'taskName'
          property :url_map_entry, as: 'urlMapEntry'
          property :instance_index, as: 'instanceIndex'
          property :host, as: 'host'
          property :finished, as: 'finished'
          property :http_version, as: 'httpVersion'
          property :start_time, as: 'startTime'
          property :latency, as: 'latency'
          property :ip, as: 'ip'
          property :app_id, as: 'appId'
          property :app_engine_release, as: 'appEngineRelease'
          property :method_prop, as: 'method'
          property :cost, as: 'cost'
          property :instance_id, as: 'instanceId'
        end
      end
      
      class ListMonitoredResourceDescriptorsResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :next_page_token, as: 'nextPageToken'
          collection :resource_descriptors, as: 'resourceDescriptors', class: Google::Apis::LoggingV2::MonitoredResourceDescriptor, decorator: Google::Apis::LoggingV2::MonitoredResourceDescriptor::Representation
      
        end
      end
      
      class SourceReference
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :repository, as: 'repository'
          property :revision_id, as: 'revisionId'
        end
      end
      
      class WriteLogEntriesResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
        end
      end
      
      class LogMetric
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :version, as: 'version'
          property :filter, as: 'filter'
          property :name, as: 'name'
          property :description, as: 'description'
        end
      end
      
      class LogEntryOperation
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :id, as: 'id'
          property :producer, as: 'producer'
          property :first, as: 'first'
          property :last, as: 'last'
        end
      end
      
      class MonitoredResource
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :type, as: 'type'
          hash :labels, as: 'labels'
        end
      end
      
      class LogSink
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :name, as: 'name'
          property :include_children, as: 'includeChildren'
          property :destination, as: 'destination'
          property :filter, as: 'filter'
          property :end_time, as: 'endTime'
          property :writer_identity, as: 'writerIdentity'
          property :start_time, as: 'startTime'
          property :output_version_format, as: 'outputVersionFormat'
        end
      end
      
      class WriteLogEntriesRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :log_name, as: 'logName'
          collection :entries, as: 'entries', class: Google::Apis::LoggingV2::LogEntry, decorator: Google::Apis::LoggingV2::LogEntry::Representation
      
          property :partial_success, as: 'partialSuccess'
          hash :labels, as: 'labels'
          property :resource, as: 'resource', class: Google::Apis::LoggingV2::MonitoredResource, decorator: Google::Apis::LoggingV2::MonitoredResource::Representation
      
        end
      end
      
      class ListLogsResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :log_names, as: 'logNames'
          property :next_page_token, as: 'nextPageToken'
        end
      end
      
      class HttpRequest
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :cache_validated_with_origin_server, as: 'cacheValidatedWithOriginServer'
          property :status, as: 'status'
          property :referer, as: 'referer'
          property :user_agent, as: 'userAgent'
          property :latency, as: 'latency'
          property :cache_fill_bytes, :numeric_string => true, as: 'cacheFillBytes'
          property :request_method, as: 'requestMethod'
          property :response_size, :numeric_string => true, as: 'responseSize'
          property :request_size, :numeric_string => true, as: 'requestSize'
          property :request_url, as: 'requestUrl'
          property :server_ip, as: 'serverIp'
          property :remote_ip, as: 'remoteIp'
          property :cache_lookup, as: 'cacheLookup'
          property :cache_hit, as: 'cacheHit'
        end
      end
      
      class ListSinksResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :next_page_token, as: 'nextPageToken'
          collection :sinks, as: 'sinks', class: Google::Apis::LoggingV2::LogSink, decorator: Google::Apis::LoggingV2::LogSink::Representation
      
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
      
      class MonitoredResourceDescriptor
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :name, as: 'name'
          property :display_name, as: 'displayName'
          property :description, as: 'description'
          property :type, as: 'type'
          collection :labels, as: 'labels', class: Google::Apis::LoggingV2::LabelDescriptor, decorator: Google::Apis::LoggingV2::LabelDescriptor::Representation
      
        end
      end
      
      class LogEntrySourceLocation
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :file, as: 'file'
          property :function, as: 'function'
          property :line, :numeric_string => true, as: 'line'
        end
      end
      
      class ListLogEntriesResponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :next_page_token, as: 'nextPageToken'
          collection :entries, as: 'entries', class: Google::Apis::LoggingV2::LogEntry, decorator: Google::Apis::LoggingV2::LogEntry::Representation
      
        end
      end
    end
  end
end
