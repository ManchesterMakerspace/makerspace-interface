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
    module DatastoreV1
      
      # The response for Datastore.BeginTransaction.
      class BeginTransactionResponse
        include Google::Apis::Core::Hashable
      
        # The transaction identifier (always present).
        # Corresponds to the JSON property `transaction`
        # NOTE: Values are automatically base64 encoded/decoded in the client library.
        # @return [String]
        attr_accessor :transaction
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @transaction = args[:transaction] if args.key?(:transaction)
        end
      end
      
      # The response for Datastore.RunQuery.
      class RunQueryResponse
        include Google::Apis::Core::Hashable
      
        # A query for entities.
        # Corresponds to the JSON property `query`
        # @return [Google::Apis::DatastoreV1::Query]
        attr_accessor :query
      
        # A batch of results produced by a query.
        # Corresponds to the JSON property `batch`
        # @return [Google::Apis::DatastoreV1::QueryResultBatch]
        attr_accessor :batch
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @query = args[:query] if args.key?(:query)
          @batch = args[:batch] if args.key?(:batch)
        end
      end
      
      # The response for Datastore.Lookup.
      class LookupResponse
        include Google::Apis::Core::Hashable
      
        # Entities found as `ResultType.FULL` entities. The order of results in this
        # field is undefined and has no relation to the order of the keys in the
        # input.
        # Corresponds to the JSON property `found`
        # @return [Array<Google::Apis::DatastoreV1::EntityResult>]
        attr_accessor :found
      
        # Entities not found as `ResultType.KEY_ONLY` entities. The order of results
        # in this field is undefined and has no relation to the order of the keys
        # in the input.
        # Corresponds to the JSON property `missing`
        # @return [Array<Google::Apis::DatastoreV1::EntityResult>]
        attr_accessor :missing
      
        # A list of keys that were not looked up due to resource constraints. The
        # order of results in this field is undefined and has no relation to the
        # order of the keys in the input.
        # Corresponds to the JSON property `deferred`
        # @return [Array<Google::Apis::DatastoreV1::Key>]
        attr_accessor :deferred
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @found = args[:found] if args.key?(:found)
          @missing = args[:missing] if args.key?(:missing)
          @deferred = args[:deferred] if args.key?(:deferred)
        end
      end
      
      # The request for Datastore.AllocateIds.
      class AllocateIdsRequest
        include Google::Apis::Core::Hashable
      
        # A list of keys with incomplete key paths for which to allocate IDs.
        # No key may be reserved/read-only.
        # Corresponds to the JSON property `keys`
        # @return [Array<Google::Apis::DatastoreV1::Key>]
        attr_accessor :keys
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @keys = args[:keys] if args.key?(:keys)
        end
      end
      
      # The request for Datastore.Commit.
      class CommitRequest
        include Google::Apis::Core::Hashable
      
        # The identifier of the transaction associated with the commit. A
        # transaction identifier is returned by a call to
        # Datastore.BeginTransaction.
        # Corresponds to the JSON property `transaction`
        # NOTE: Values are automatically base64 encoded/decoded in the client library.
        # @return [String]
        attr_accessor :transaction
      
        # The type of commit to perform. Defaults to `TRANSACTIONAL`.
        # Corresponds to the JSON property `mode`
        # @return [String]
        attr_accessor :mode
      
        # The mutations to perform.
        # When mode is `TRANSACTIONAL`, mutations affecting a single entity are
        # applied in order. The following sequences of mutations affecting a single
        # entity are not permitted in a single `Commit` request:
        # - `insert` followed by `insert`
        # - `update` followed by `insert`
        # - `upsert` followed by `insert`
        # - `delete` followed by `update`
        # When mode is `NON_TRANSACTIONAL`, no two mutations may affect a single
        # entity.
        # Corresponds to the JSON property `mutations`
        # @return [Array<Google::Apis::DatastoreV1::Mutation>]
        attr_accessor :mutations
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @transaction = args[:transaction] if args.key?(:transaction)
          @mode = args[:mode] if args.key?(:mode)
          @mutations = args[:mutations] if args.key?(:mutations)
        end
      end
      
      # The request for Datastore.BeginTransaction.
      class BeginTransactionRequest
        include Google::Apis::Core::Hashable
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
        end
      end
      
      # The desired order for a specific property.
      class PropertyOrder
        include Google::Apis::Core::Hashable
      
        # A reference to a property relative to the kind expressions.
        # Corresponds to the JSON property `property`
        # @return [Google::Apis::DatastoreV1::PropertyReference]
        attr_accessor :property
      
        # The direction to order by. Defaults to `ASCENDING`.
        # Corresponds to the JSON property `direction`
        # @return [String]
        attr_accessor :direction
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @property = args[:property] if args.key?(:property)
          @direction = args[:direction] if args.key?(:direction)
        end
      end
      
      # A representation of a kind.
      class KindExpression
        include Google::Apis::Core::Hashable
      
        # The name of the kind.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @name = args[:name] if args.key?(:name)
        end
      end
      
      # An object representing a latitude/longitude pair. This is expressed as a pair
      # of doubles representing degrees latitude and degrees longitude. Unless
      # specified otherwise, this must conform to the
      # <a href="http://www.unoosa.org/pdf/icg/2012/template/WGS_84.pdf">WGS84
      # standard</a>. Values must be within normalized ranges.
      # Example of normalization code in Python:
      # def NormalizeLongitude(longitude):
      # """Wraps decimal degrees longitude to [-180.0, 180.0]."""
      # q, r = divmod(longitude, 360.0)
      # if r > 180.0 or (r == 180.0 and q <= -1.0):
      # return r - 360.0
      # return r
      # def NormalizeLatLng(latitude, longitude):
      # """Wraps decimal degrees latitude and longitude to
      # [-90.0, 90.0] and [-180.0, 180.0], respectively."""
      # r = latitude % 360.0
      # if r <= 90.0:
      # return r, NormalizeLongitude(longitude)
      # elif r >= 270.0:
      # return r - 360, NormalizeLongitude(longitude)
      # else:
      # return 180 - r, NormalizeLongitude(longitude + 180.0)
      # assert 180.0 == NormalizeLongitude(180.0)
      # assert -180.0 == NormalizeLongitude(-180.0)
      # assert -179.0 == NormalizeLongitude(181.0)
      # assert (0.0, 0.0) == NormalizeLatLng(360.0, 0.0)
      # assert (0.0, 0.0) == NormalizeLatLng(-360.0, 0.0)
      # assert (85.0, 180.0) == NormalizeLatLng(95.0, 0.0)
      # assert (-85.0, -170.0) == NormalizeLatLng(-95.0, 10.0)
      # assert (90.0, 10.0) == NormalizeLatLng(90.0, 10.0)
      # assert (-90.0, -10.0) == NormalizeLatLng(-90.0, -10.0)
      # assert (0.0, -170.0) == NormalizeLatLng(-180.0, 10.0)
      # assert (0.0, -170.0) == NormalizeLatLng(180.0, 10.0)
      # assert (-90.0, 10.0) == NormalizeLatLng(270.0, 10.0)
      # assert (90.0, 10.0) == NormalizeLatLng(-270.0, 10.0)
      class LatLng
        include Google::Apis::Core::Hashable
      
        # The latitude in degrees. It must be in the range [-90.0, +90.0].
        # Corresponds to the JSON property `latitude`
        # @return [Float]
        attr_accessor :latitude
      
        # The longitude in degrees. It must be in the range [-180.0, +180.0].
        # Corresponds to the JSON property `longitude`
        # @return [Float]
        attr_accessor :longitude
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @latitude = args[:latitude] if args.key?(:latitude)
          @longitude = args[:longitude] if args.key?(:longitude)
        end
      end
      
      # A unique identifier for an entity.
      # If a key's partition ID or any of its path kinds or names are
      # reserved/read-only, the key is reserved/read-only.
      # A reserved/read-only key is forbidden in certain documented contexts.
      class Key
        include Google::Apis::Core::Hashable
      
        # The entity path.
        # An entity path consists of one or more elements composed of a kind and a
        # string or numerical identifier, which identify entities. The first
        # element identifies a _root entity_, the second element identifies
        # a _child_ of the root entity, the third element identifies a child of the
        # second entity, and so forth. The entities identified by all prefixes of
        # the path are called the element's _ancestors_.
        # An entity path is always fully complete: *all* of the entity's ancestors
        # are required to be in the path along with the entity identifier itself.
        # The only exception is that in some documented cases, the identifier in the
        # last path element (for the entity) itself may be omitted. For example,
        # the last path element of the key of `Mutation.insert` may have no
        # identifier.
        # A path can never be empty, and a path can have at most 100 elements.
        # Corresponds to the JSON property `path`
        # @return [Array<Google::Apis::DatastoreV1::PathElement>]
        attr_accessor :path
      
        # A partition ID identifies a grouping of entities. The grouping is always
        # by project and namespace, however the namespace ID may be empty.
        # A partition ID contains several dimensions:
        # project ID and namespace ID.
        # Partition dimensions:
        # - May be `""`.
        # - Must be valid UTF-8 bytes.
        # - Must have values that match regex `[A-Za-z\d\.\-_]`1,100``
        # If the value of any dimension matches regex `__.*__`, the partition is
        # reserved/read-only.
        # A reserved/read-only partition ID is forbidden in certain documented
        # contexts.
        # Foreign partition IDs (in which the project ID does
        # not match the context project ID ) are discouraged.
        # Reads and writes of foreign partition IDs may fail if the project is not in an
        # active state.
        # Corresponds to the JSON property `partitionId`
        # @return [Google::Apis::DatastoreV1::PartitionId]
        attr_accessor :partition_id
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @path = args[:path] if args.key?(:path)
          @partition_id = args[:partition_id] if args.key?(:partition_id)
        end
      end
      
      # A reference to a property relative to the kind expressions.
      class PropertyReference
        include Google::Apis::Core::Hashable
      
        # The name of the property.
        # If name includes "."s, it may be interpreted as a property name path.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @name = args[:name] if args.key?(:name)
        end
      end
      
      # An array value.
      class ArrayValue
        include Google::Apis::Core::Hashable
      
        # Values in the array.
        # The order of this array may not be preserved if it contains a mix of
        # indexed and unindexed values.
        # Corresponds to the JSON property `values`
        # @return [Array<Google::Apis::DatastoreV1::Value>]
        attr_accessor :values
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @values = args[:values] if args.key?(:values)
        end
      end
      
      # A representation of a property in a projection.
      class Projection
        include Google::Apis::Core::Hashable
      
        # A reference to a property relative to the kind expressions.
        # Corresponds to the JSON property `property`
        # @return [Google::Apis::DatastoreV1::PropertyReference]
        attr_accessor :property
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @property = args[:property] if args.key?(:property)
        end
      end
      
      # A mutation to apply to an entity.
      class Mutation
        include Google::Apis::Core::Hashable
      
        # A Datastore data object.
        # An entity is limited to 1 megabyte when stored. That _roughly_
        # corresponds to a limit of 1 megabyte for the serialized form of this
        # message.
        # Corresponds to the JSON property `update`
        # @return [Google::Apis::DatastoreV1::Entity]
        attr_accessor :update
      
        # A Datastore data object.
        # An entity is limited to 1 megabyte when stored. That _roughly_
        # corresponds to a limit of 1 megabyte for the serialized form of this
        # message.
        # Corresponds to the JSON property `upsert`
        # @return [Google::Apis::DatastoreV1::Entity]
        attr_accessor :upsert
      
        # A unique identifier for an entity.
        # If a key's partition ID or any of its path kinds or names are
        # reserved/read-only, the key is reserved/read-only.
        # A reserved/read-only key is forbidden in certain documented contexts.
        # Corresponds to the JSON property `delete`
        # @return [Google::Apis::DatastoreV1::Key]
        attr_accessor :delete
      
        # A Datastore data object.
        # An entity is limited to 1 megabyte when stored. That _roughly_
        # corresponds to a limit of 1 megabyte for the serialized form of this
        # message.
        # Corresponds to the JSON property `insert`
        # @return [Google::Apis::DatastoreV1::Entity]
        attr_accessor :insert
      
        # The version of the entity that this mutation is being applied to. If this
        # does not match the current version on the server, the mutation conflicts.
        # Corresponds to the JSON property `baseVersion`
        # @return [Fixnum]
        attr_accessor :base_version
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @update = args[:update] if args.key?(:update)
          @upsert = args[:upsert] if args.key?(:upsert)
          @delete = args[:delete] if args.key?(:delete)
          @insert = args[:insert] if args.key?(:insert)
          @base_version = args[:base_version] if args.key?(:base_version)
        end
      end
      
      # The options shared by read requests.
      class ReadOptions
        include Google::Apis::Core::Hashable
      
        # The non-transactional read consistency to use.
        # Cannot be set to `STRONG` for global queries.
        # Corresponds to the JSON property `readConsistency`
        # @return [String]
        attr_accessor :read_consistency
      
        # The identifier of the transaction in which to read. A
        # transaction identifier is returned by a call to
        # Datastore.BeginTransaction.
        # Corresponds to the JSON property `transaction`
        # NOTE: Values are automatically base64 encoded/decoded in the client library.
        # @return [String]
        attr_accessor :transaction
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @read_consistency = args[:read_consistency] if args.key?(:read_consistency)
          @transaction = args[:transaction] if args.key?(:transaction)
        end
      end
      
      # The response for Datastore.Rollback.
      # (an empty message).
      class RollbackResponse
        include Google::Apis::Core::Hashable
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
        end
      end
      
      # The result of applying a mutation.
      class MutationResult
        include Google::Apis::Core::Hashable
      
        # The version of the entity on the server after processing the mutation. If
        # the mutation doesn't change anything on the server, then the version will
        # be the version of the current entity or, if no entity is present, a version
        # that is strictly greater than the version of any previous entity and less
        # than the version of any possible future entity.
        # Corresponds to the JSON property `version`
        # @return [Fixnum]
        attr_accessor :version
      
        # Whether a conflict was detected for this mutation. Always false when a
        # conflict detection strategy field is not set in the mutation.
        # Corresponds to the JSON property `conflictDetected`
        # @return [Boolean]
        attr_accessor :conflict_detected
        alias_method :conflict_detected?, :conflict_detected
      
        # A unique identifier for an entity.
        # If a key's partition ID or any of its path kinds or names are
        # reserved/read-only, the key is reserved/read-only.
        # A reserved/read-only key is forbidden in certain documented contexts.
        # Corresponds to the JSON property `key`
        # @return [Google::Apis::DatastoreV1::Key]
        attr_accessor :key
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @version = args[:version] if args.key?(:version)
          @conflict_detected = args[:conflict_detected] if args.key?(:conflict_detected)
          @key = args[:key] if args.key?(:key)
        end
      end
      
      # A [GQL query](https://cloud.google.com/datastore/docs/apis/gql/gql_reference).
      class GqlQuery
        include Google::Apis::Core::Hashable
      
        # A string of the format described
        # [here](https://cloud.google.com/datastore/docs/apis/gql/gql_reference).
        # Corresponds to the JSON property `queryString`
        # @return [String]
        attr_accessor :query_string
      
        # When false, the query string must not contain any literals and instead must
        # bind all values. For example,
        # `SELECT * FROM Kind WHERE a = 'string literal'` is not allowed, while
        # `SELECT * FROM Kind WHERE a = @value` is.
        # Corresponds to the JSON property `allowLiterals`
        # @return [Boolean]
        attr_accessor :allow_literals
        alias_method :allow_literals?, :allow_literals
      
        # For each non-reserved named binding site in the query string, there must be
        # a named parameter with that name, but not necessarily the inverse.
        # Key must match regex `A-Za-z_$*`, must not match regex
        # `__.*__`, and must not be `""`.
        # Corresponds to the JSON property `namedBindings`
        # @return [Hash<String,Google::Apis::DatastoreV1::GqlQueryParameter>]
        attr_accessor :named_bindings
      
        # Numbered binding site @1 references the first numbered parameter,
        # effectively using 1-based indexing, rather than the usual 0.
        # For each binding site numbered i in `query_string`, there must be an i-th
        # numbered parameter. The inverse must also be true.
        # Corresponds to the JSON property `positionalBindings`
        # @return [Array<Google::Apis::DatastoreV1::GqlQueryParameter>]
        attr_accessor :positional_bindings
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @query_string = args[:query_string] if args.key?(:query_string)
          @allow_literals = args[:allow_literals] if args.key?(:allow_literals)
          @named_bindings = args[:named_bindings] if args.key?(:named_bindings)
          @positional_bindings = args[:positional_bindings] if args.key?(:positional_bindings)
        end
      end
      
      # A holder for any type of filter.
      class Filter
        include Google::Apis::Core::Hashable
      
        # A filter that merges multiple other filters using the given operator.
        # Corresponds to the JSON property `compositeFilter`
        # @return [Google::Apis::DatastoreV1::CompositeFilter]
        attr_accessor :composite_filter
      
        # A filter on a specific property.
        # Corresponds to the JSON property `propertyFilter`
        # @return [Google::Apis::DatastoreV1::PropertyFilter]
        attr_accessor :property_filter
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @composite_filter = args[:composite_filter] if args.key?(:composite_filter)
          @property_filter = args[:property_filter] if args.key?(:property_filter)
        end
      end
      
      # The request for Datastore.Rollback.
      class RollbackRequest
        include Google::Apis::Core::Hashable
      
        # The transaction identifier, returned by a call to
        # Datastore.BeginTransaction.
        # Corresponds to the JSON property `transaction`
        # NOTE: Values are automatically base64 encoded/decoded in the client library.
        # @return [String]
        attr_accessor :transaction
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @transaction = args[:transaction] if args.key?(:transaction)
        end
      end
      
      # The request for Datastore.RunQuery.
      class RunQueryRequest
        include Google::Apis::Core::Hashable
      
        # The options shared by read requests.
        # Corresponds to the JSON property `readOptions`
        # @return [Google::Apis::DatastoreV1::ReadOptions]
        attr_accessor :read_options
      
        # A query for entities.
        # Corresponds to the JSON property `query`
        # @return [Google::Apis::DatastoreV1::Query]
        attr_accessor :query
      
        # A partition ID identifies a grouping of entities. The grouping is always
        # by project and namespace, however the namespace ID may be empty.
        # A partition ID contains several dimensions:
        # project ID and namespace ID.
        # Partition dimensions:
        # - May be `""`.
        # - Must be valid UTF-8 bytes.
        # - Must have values that match regex `[A-Za-z\d\.\-_]`1,100``
        # If the value of any dimension matches regex `__.*__`, the partition is
        # reserved/read-only.
        # A reserved/read-only partition ID is forbidden in certain documented
        # contexts.
        # Foreign partition IDs (in which the project ID does
        # not match the context project ID ) are discouraged.
        # Reads and writes of foreign partition IDs may fail if the project is not in an
        # active state.
        # Corresponds to the JSON property `partitionId`
        # @return [Google::Apis::DatastoreV1::PartitionId]
        attr_accessor :partition_id
      
        # A [GQL query](https://cloud.google.com/datastore/docs/apis/gql/gql_reference).
        # Corresponds to the JSON property `gqlQuery`
        # @return [Google::Apis::DatastoreV1::GqlQuery]
        attr_accessor :gql_query
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @read_options = args[:read_options] if args.key?(:read_options)
          @query = args[:query] if args.key?(:query)
          @partition_id = args[:partition_id] if args.key?(:partition_id)
          @gql_query = args[:gql_query] if args.key?(:gql_query)
        end
      end
      
      # A filter that merges multiple other filters using the given operator.
      class CompositeFilter
        include Google::Apis::Core::Hashable
      
        # The list of filters to combine.
        # Must contain at least one filter.
        # Corresponds to the JSON property `filters`
        # @return [Array<Google::Apis::DatastoreV1::Filter>]
        attr_accessor :filters
      
        # The operator for combining multiple filters.
        # Corresponds to the JSON property `op`
        # @return [String]
        attr_accessor :op
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @filters = args[:filters] if args.key?(:filters)
          @op = args[:op] if args.key?(:op)
        end
      end
      
      # The response for Datastore.AllocateIds.
      class AllocateIdsResponse
        include Google::Apis::Core::Hashable
      
        # The keys specified in the request (in the same order), each with
        # its key path completed with a newly allocated ID.
        # Corresponds to the JSON property `keys`
        # @return [Array<Google::Apis::DatastoreV1::Key>]
        attr_accessor :keys
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @keys = args[:keys] if args.key?(:keys)
        end
      end
      
      # A query for entities.
      class Query
        include Google::Apis::Core::Hashable
      
        # The projection to return. Defaults to returning all properties.
        # Corresponds to the JSON property `projection`
        # @return [Array<Google::Apis::DatastoreV1::Projection>]
        attr_accessor :projection
      
        # An ending point for the query results. Query cursors are
        # returned in query result batches and
        # [can only be used to limit the same query](https://cloud.google.com/datastore/
        # docs/concepts/queries#cursors_limits_and_offsets).
        # Corresponds to the JSON property `endCursor`
        # NOTE: Values are automatically base64 encoded/decoded in the client library.
        # @return [String]
        attr_accessor :end_cursor
      
        # The maximum number of results to return. Applies after all other
        # constraints. Optional.
        # Unspecified is interpreted as no limit.
        # Must be >= 0 if specified.
        # Corresponds to the JSON property `limit`
        # @return [Fixnum]
        attr_accessor :limit
      
        # A holder for any type of filter.
        # Corresponds to the JSON property `filter`
        # @return [Google::Apis::DatastoreV1::Filter]
        attr_accessor :filter
      
        # The number of results to skip. Applies before limit, but after all other
        # constraints. Optional. Must be >= 0 if specified.
        # Corresponds to the JSON property `offset`
        # @return [Fixnum]
        attr_accessor :offset
      
        # A starting point for the query results. Query cursors are
        # returned in query result batches and
        # [can only be used to continue the same query](https://cloud.google.com/
        # datastore/docs/concepts/queries#cursors_limits_and_offsets).
        # Corresponds to the JSON property `startCursor`
        # NOTE: Values are automatically base64 encoded/decoded in the client library.
        # @return [String]
        attr_accessor :start_cursor
      
        # The kinds to query (if empty, returns entities of all kinds).
        # Currently at most 1 kind may be specified.
        # Corresponds to the JSON property `kind`
        # @return [Array<Google::Apis::DatastoreV1::KindExpression>]
        attr_accessor :kind
      
        # The properties to make distinct. The query results will contain the first
        # result for each distinct combination of values for the given properties
        # (if empty, all results are returned).
        # Corresponds to the JSON property `distinctOn`
        # @return [Array<Google::Apis::DatastoreV1::PropertyReference>]
        attr_accessor :distinct_on
      
        # The order to apply to the query results (if empty, order is unspecified).
        # Corresponds to the JSON property `order`
        # @return [Array<Google::Apis::DatastoreV1::PropertyOrder>]
        attr_accessor :order
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @projection = args[:projection] if args.key?(:projection)
          @end_cursor = args[:end_cursor] if args.key?(:end_cursor)
          @limit = args[:limit] if args.key?(:limit)
          @filter = args[:filter] if args.key?(:filter)
          @offset = args[:offset] if args.key?(:offset)
          @start_cursor = args[:start_cursor] if args.key?(:start_cursor)
          @kind = args[:kind] if args.key?(:kind)
          @distinct_on = args[:distinct_on] if args.key?(:distinct_on)
          @order = args[:order] if args.key?(:order)
        end
      end
      
      # A filter on a specific property.
      class PropertyFilter
        include Google::Apis::Core::Hashable
      
        # A message that can hold any of the supported value types and associated
        # metadata.
        # Corresponds to the JSON property `value`
        # @return [Google::Apis::DatastoreV1::Value]
        attr_accessor :value
      
        # A reference to a property relative to the kind expressions.
        # Corresponds to the JSON property `property`
        # @return [Google::Apis::DatastoreV1::PropertyReference]
        attr_accessor :property
      
        # The operator to filter by.
        # Corresponds to the JSON property `op`
        # @return [String]
        attr_accessor :op
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @value = args[:value] if args.key?(:value)
          @property = args[:property] if args.key?(:property)
          @op = args[:op] if args.key?(:op)
        end
      end
      
      # The result of fetching an entity from Datastore.
      class EntityResult
        include Google::Apis::Core::Hashable
      
        # A cursor that points to the position after the result entity.
        # Set only when the `EntityResult` is part of a `QueryResultBatch` message.
        # Corresponds to the JSON property `cursor`
        # NOTE: Values are automatically base64 encoded/decoded in the client library.
        # @return [String]
        attr_accessor :cursor
      
        # The version of the entity, a strictly positive number that monotonically
        # increases with changes to the entity.
        # This field is set for `FULL` entity
        # results.
        # For missing entities in `LookupResponse`, this
        # is the version of the snapshot that was used to look up the entity, and it
        # is always set except for eventually consistent reads.
        # Corresponds to the JSON property `version`
        # @return [Fixnum]
        attr_accessor :version
      
        # A Datastore data object.
        # An entity is limited to 1 megabyte when stored. That _roughly_
        # corresponds to a limit of 1 megabyte for the serialized form of this
        # message.
        # Corresponds to the JSON property `entity`
        # @return [Google::Apis::DatastoreV1::Entity]
        attr_accessor :entity
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @cursor = args[:cursor] if args.key?(:cursor)
          @version = args[:version] if args.key?(:version)
          @entity = args[:entity] if args.key?(:entity)
        end
      end
      
      # The response for Datastore.Commit.
      class CommitResponse
        include Google::Apis::Core::Hashable
      
        # The number of index entries updated during the commit, or zero if none were
        # updated.
        # Corresponds to the JSON property `indexUpdates`
        # @return [Fixnum]
        attr_accessor :index_updates
      
        # The result of performing the mutations.
        # The i-th mutation result corresponds to the i-th mutation in the request.
        # Corresponds to the JSON property `mutationResults`
        # @return [Array<Google::Apis::DatastoreV1::MutationResult>]
        attr_accessor :mutation_results
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @index_updates = args[:index_updates] if args.key?(:index_updates)
          @mutation_results = args[:mutation_results] if args.key?(:mutation_results)
        end
      end
      
      # A message that can hold any of the supported value types and associated
      # metadata.
      class Value
        include Google::Apis::Core::Hashable
      
        # A Datastore data object.
        # An entity is limited to 1 megabyte when stored. That _roughly_
        # corresponds to a limit of 1 megabyte for the serialized form of this
        # message.
        # Corresponds to the JSON property `entityValue`
        # @return [Google::Apis::DatastoreV1::Entity]
        attr_accessor :entity_value
      
        # An object representing a latitude/longitude pair. This is expressed as a pair
        # of doubles representing degrees latitude and degrees longitude. Unless
        # specified otherwise, this must conform to the
        # <a href="http://www.unoosa.org/pdf/icg/2012/template/WGS_84.pdf">WGS84
        # standard</a>. Values must be within normalized ranges.
        # Example of normalization code in Python:
        # def NormalizeLongitude(longitude):
        # """Wraps decimal degrees longitude to [-180.0, 180.0]."""
        # q, r = divmod(longitude, 360.0)
        # if r > 180.0 or (r == 180.0 and q <= -1.0):
        # return r - 360.0
        # return r
        # def NormalizeLatLng(latitude, longitude):
        # """Wraps decimal degrees latitude and longitude to
        # [-90.0, 90.0] and [-180.0, 180.0], respectively."""
        # r = latitude % 360.0
        # if r <= 90.0:
        # return r, NormalizeLongitude(longitude)
        # elif r >= 270.0:
        # return r - 360, NormalizeLongitude(longitude)
        # else:
        # return 180 - r, NormalizeLongitude(longitude + 180.0)
        # assert 180.0 == NormalizeLongitude(180.0)
        # assert -180.0 == NormalizeLongitude(-180.0)
        # assert -179.0 == NormalizeLongitude(181.0)
        # assert (0.0, 0.0) == NormalizeLatLng(360.0, 0.0)
        # assert (0.0, 0.0) == NormalizeLatLng(-360.0, 0.0)
        # assert (85.0, 180.0) == NormalizeLatLng(95.0, 0.0)
        # assert (-85.0, -170.0) == NormalizeLatLng(-95.0, 10.0)
        # assert (90.0, 10.0) == NormalizeLatLng(90.0, 10.0)
        # assert (-90.0, -10.0) == NormalizeLatLng(-90.0, -10.0)
        # assert (0.0, -170.0) == NormalizeLatLng(-180.0, 10.0)
        # assert (0.0, -170.0) == NormalizeLatLng(180.0, 10.0)
        # assert (-90.0, 10.0) == NormalizeLatLng(270.0, 10.0)
        # assert (90.0, 10.0) == NormalizeLatLng(-270.0, 10.0)
        # Corresponds to the JSON property `geoPointValue`
        # @return [Google::Apis::DatastoreV1::LatLng]
        attr_accessor :geo_point_value
      
        # A unique identifier for an entity.
        # If a key's partition ID or any of its path kinds or names are
        # reserved/read-only, the key is reserved/read-only.
        # A reserved/read-only key is forbidden in certain documented contexts.
        # Corresponds to the JSON property `keyValue`
        # @return [Google::Apis::DatastoreV1::Key]
        attr_accessor :key_value
      
        # An integer value.
        # Corresponds to the JSON property `integerValue`
        # @return [Fixnum]
        attr_accessor :integer_value
      
        # A UTF-8 encoded string value.
        # When `exclude_from_indexes` is false (it is indexed) , may have at most 1500
        # bytes.
        # Otherwise, may be set to at least 1,000,000 bytes.
        # Corresponds to the JSON property `stringValue`
        # @return [String]
        attr_accessor :string_value
      
        # If the value should be excluded from all indexes including those defined
        # explicitly.
        # Corresponds to the JSON property `excludeFromIndexes`
        # @return [Boolean]
        attr_accessor :exclude_from_indexes
        alias_method :exclude_from_indexes?, :exclude_from_indexes
      
        # A double value.
        # Corresponds to the JSON property `doubleValue`
        # @return [Float]
        attr_accessor :double_value
      
        # A timestamp value.
        # When stored in the Datastore, precise only to microseconds;
        # any additional precision is rounded down.
        # Corresponds to the JSON property `timestampValue`
        # @return [String]
        attr_accessor :timestamp_value
      
        # A boolean value.
        # Corresponds to the JSON property `booleanValue`
        # @return [Boolean]
        attr_accessor :boolean_value
        alias_method :boolean_value?, :boolean_value
      
        # A null value.
        # Corresponds to the JSON property `nullValue`
        # @return [String]
        attr_accessor :null_value
      
        # A blob value.
        # May have at most 1,000,000 bytes.
        # When `exclude_from_indexes` is false, may have at most 1500 bytes.
        # In JSON requests, must be base64-encoded.
        # Corresponds to the JSON property `blobValue`
        # NOTE: Values are automatically base64 encoded/decoded in the client library.
        # @return [String]
        attr_accessor :blob_value
      
        # The `meaning` field should only be populated for backwards compatibility.
        # Corresponds to the JSON property `meaning`
        # @return [Fixnum]
        attr_accessor :meaning
      
        # An array value.
        # Corresponds to the JSON property `arrayValue`
        # @return [Google::Apis::DatastoreV1::ArrayValue]
        attr_accessor :array_value
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @entity_value = args[:entity_value] if args.key?(:entity_value)
          @geo_point_value = args[:geo_point_value] if args.key?(:geo_point_value)
          @key_value = args[:key_value] if args.key?(:key_value)
          @integer_value = args[:integer_value] if args.key?(:integer_value)
          @string_value = args[:string_value] if args.key?(:string_value)
          @exclude_from_indexes = args[:exclude_from_indexes] if args.key?(:exclude_from_indexes)
          @double_value = args[:double_value] if args.key?(:double_value)
          @timestamp_value = args[:timestamp_value] if args.key?(:timestamp_value)
          @boolean_value = args[:boolean_value] if args.key?(:boolean_value)
          @null_value = args[:null_value] if args.key?(:null_value)
          @blob_value = args[:blob_value] if args.key?(:blob_value)
          @meaning = args[:meaning] if args.key?(:meaning)
          @array_value = args[:array_value] if args.key?(:array_value)
        end
      end
      
      # A partition ID identifies a grouping of entities. The grouping is always
      # by project and namespace, however the namespace ID may be empty.
      # A partition ID contains several dimensions:
      # project ID and namespace ID.
      # Partition dimensions:
      # - May be `""`.
      # - Must be valid UTF-8 bytes.
      # - Must have values that match regex `[A-Za-z\d\.\-_]`1,100``
      # If the value of any dimension matches regex `__.*__`, the partition is
      # reserved/read-only.
      # A reserved/read-only partition ID is forbidden in certain documented
      # contexts.
      # Foreign partition IDs (in which the project ID does
      # not match the context project ID ) are discouraged.
      # Reads and writes of foreign partition IDs may fail if the project is not in an
      # active state.
      class PartitionId
        include Google::Apis::Core::Hashable
      
        # If not empty, the ID of the namespace to which the entities belong.
        # Corresponds to the JSON property `namespaceId`
        # @return [String]
        attr_accessor :namespace_id
      
        # The ID of the project to which the entities belong.
        # Corresponds to the JSON property `projectId`
        # @return [String]
        attr_accessor :project_id
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @namespace_id = args[:namespace_id] if args.key?(:namespace_id)
          @project_id = args[:project_id] if args.key?(:project_id)
        end
      end
      
      # A Datastore data object.
      # An entity is limited to 1 megabyte when stored. That _roughly_
      # corresponds to a limit of 1 megabyte for the serialized form of this
      # message.
      class Entity
        include Google::Apis::Core::Hashable
      
        # A unique identifier for an entity.
        # If a key's partition ID or any of its path kinds or names are
        # reserved/read-only, the key is reserved/read-only.
        # A reserved/read-only key is forbidden in certain documented contexts.
        # Corresponds to the JSON property `key`
        # @return [Google::Apis::DatastoreV1::Key]
        attr_accessor :key
      
        # The entity's properties.
        # The map's keys are property names.
        # A property name matching regex `__.*__` is reserved.
        # A reserved property name is forbidden in certain documented contexts.
        # The name must not contain more than 500 characters.
        # The name cannot be `""`.
        # Corresponds to the JSON property `properties`
        # @return [Hash<String,Google::Apis::DatastoreV1::Value>]
        attr_accessor :properties
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @key = args[:key] if args.key?(:key)
          @properties = args[:properties] if args.key?(:properties)
        end
      end
      
      # A batch of results produced by a query.
      class QueryResultBatch
        include Google::Apis::Core::Hashable
      
        # The results for this batch.
        # Corresponds to the JSON property `entityResults`
        # @return [Array<Google::Apis::DatastoreV1::EntityResult>]
        attr_accessor :entity_results
      
        # A cursor that points to the position after the last result in the batch.
        # Corresponds to the JSON property `endCursor`
        # NOTE: Values are automatically base64 encoded/decoded in the client library.
        # @return [String]
        attr_accessor :end_cursor
      
        # The state of the query after the current batch.
        # Corresponds to the JSON property `moreResults`
        # @return [String]
        attr_accessor :more_results
      
        # The version number of the snapshot this batch was returned from.
        # This applies to the range of results from the query's `start_cursor` (or
        # the beginning of the query if no cursor was given) to this batch's
        # `end_cursor` (not the query's `end_cursor`).
        # In a single transaction, subsequent query result batches for the same query
        # can have a greater snapshot version number. Each batch's snapshot version
        # is valid for all preceding batches.
        # The value will be zero for eventually consistent queries.
        # Corresponds to the JSON property `snapshotVersion`
        # @return [Fixnum]
        attr_accessor :snapshot_version
      
        # A cursor that points to the position after the last skipped result.
        # Will be set when `skipped_results` != 0.
        # Corresponds to the JSON property `skippedCursor`
        # NOTE: Values are automatically base64 encoded/decoded in the client library.
        # @return [String]
        attr_accessor :skipped_cursor
      
        # The number of results skipped, typically because of an offset.
        # Corresponds to the JSON property `skippedResults`
        # @return [Fixnum]
        attr_accessor :skipped_results
      
        # The result type for every entity in `entity_results`.
        # Corresponds to the JSON property `entityResultType`
        # @return [String]
        attr_accessor :entity_result_type
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @entity_results = args[:entity_results] if args.key?(:entity_results)
          @end_cursor = args[:end_cursor] if args.key?(:end_cursor)
          @more_results = args[:more_results] if args.key?(:more_results)
          @snapshot_version = args[:snapshot_version] if args.key?(:snapshot_version)
          @skipped_cursor = args[:skipped_cursor] if args.key?(:skipped_cursor)
          @skipped_results = args[:skipped_results] if args.key?(:skipped_results)
          @entity_result_type = args[:entity_result_type] if args.key?(:entity_result_type)
        end
      end
      
      # The request for Datastore.Lookup.
      class LookupRequest
        include Google::Apis::Core::Hashable
      
        # The options shared by read requests.
        # Corresponds to the JSON property `readOptions`
        # @return [Google::Apis::DatastoreV1::ReadOptions]
        attr_accessor :read_options
      
        # Keys of entities to look up.
        # Corresponds to the JSON property `keys`
        # @return [Array<Google::Apis::DatastoreV1::Key>]
        attr_accessor :keys
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @read_options = args[:read_options] if args.key?(:read_options)
          @keys = args[:keys] if args.key?(:keys)
        end
      end
      
      # A (kind, ID/name) pair used to construct a key path.
      # If either name or ID is set, the element is complete.
      # If neither is set, the element is incomplete.
      class PathElement
        include Google::Apis::Core::Hashable
      
        # The kind of the entity.
        # A kind matching regex `__.*__` is reserved/read-only.
        # A kind must not contain more than 1500 bytes when UTF-8 encoded.
        # Cannot be `""`.
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # The auto-allocated ID of the entity.
        # Never equal to zero. Values less than zero are discouraged and may not
        # be supported in the future.
        # Corresponds to the JSON property `id`
        # @return [Fixnum]
        attr_accessor :id
      
        # The name of the entity.
        # A name matching regex `__.*__` is reserved/read-only.
        # A name must not be more than 1500 bytes when UTF-8 encoded.
        # Cannot be `""`.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @kind = args[:kind] if args.key?(:kind)
          @id = args[:id] if args.key?(:id)
          @name = args[:name] if args.key?(:name)
        end
      end
      
      # A binding parameter for a GQL query.
      class GqlQueryParameter
        include Google::Apis::Core::Hashable
      
        # A query cursor. Query cursors are returned in query
        # result batches.
        # Corresponds to the JSON property `cursor`
        # NOTE: Values are automatically base64 encoded/decoded in the client library.
        # @return [String]
        attr_accessor :cursor
      
        # A message that can hold any of the supported value types and associated
        # metadata.
        # Corresponds to the JSON property `value`
        # @return [Google::Apis::DatastoreV1::Value]
        attr_accessor :value
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @cursor = args[:cursor] if args.key?(:cursor)
          @value = args[:value] if args.key?(:value)
        end
      end
    end
  end
end
