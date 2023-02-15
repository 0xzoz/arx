{-
   Arx Node API
   The Arx Node API is a RESTful API for client applications to interact with the Arx blockchain.

   The version of the OpenAPI document: 1.2.0

   NOTE: This file is auto generated by the openapi-generator.
   https://github.com/openapitools/openapi-generator.git

   DO NOT EDIT THIS FILE MANUALLY.

   For more info on generating Elm code, see https://eriktim.github.io/openapi-elm/
-}


module Generated.Api.Request.Accounts exposing (..)

import Generated.Api as Api
import Generated.Api.Data as Data
import Dict
import Http
import Json.Decode as D
import Json.Encode



{-| Return the authentication key and the sequence number for an account address. Optionally, a ledger version can be specified. If the ledger version is not specified in the request, the latest ledger version is used.
-}
getAccount : String -> Maybe String -> Api.Request Data.AccountData
getAccount address_path ledgerVersion_query =
    Api.request
        "GET"
        "/accounts/{address}"
        [ ( "address", identity address_path ) ]
        [ ( "ledger_version", Maybe.map identity ledgerVersion_query ) ]
        []
        Nothing
        Data.accountDataDecoder



{-| Retrieves an individual module from a given account and at a specific ledger version. If the ledger version is not specified in the request, the latest ledger version is used.  The Arx nodes prune account state history, via a configurable time window. If the requested ledger version has been pruned, the server responds with a 410.
-}
getAccountModule : String -> String -> Maybe String -> Api.Request Data.MoveModuleBytecode
getAccountModule address_path moduleName_path ledgerVersion_query =
    Api.request
        "GET"
        "/accounts/{address}/module/{module_name}"
        [ ( "address", identity address_path ), ( "moduleName", identity moduleName_path ) ]
        [ ( "ledger_version", Maybe.map identity ledgerVersion_query ) ]
        []
        Nothing
        Data.moveModuleBytecodeDecoder



{-| Retrieves all account modules' bytecode for a given account at a specific ledger version. If the ledger version is not specified in the request, the latest ledger version is used.  The Arx nodes prune account state history, via a configurable time window. If the requested ledger version has been pruned, the server responds with a 410.
-}
getAccountModules : String -> Maybe String -> Maybe String -> Maybe Int -> Api.Request (List Data.MoveModuleBytecode)
getAccountModules address_path ledgerVersion_query start_query limit_query =
    Api.request
        "GET"
        "/accounts/{address}/modules"
        [ ( "address", identity address_path ) ]
        [ ( "ledger_version", Maybe.map identity ledgerVersion_query ), ( "start", Maybe.map identity start_query ), ( "limit", Maybe.map String.fromInt limit_query ) ]
        []
        Nothing
        (D.list Data.moveModuleBytecodeDecoder)



{-| Retrieves an individual resource from a given account and at a specific ledger version. If the ledger version is not specified in the request, the latest ledger version is used.  The Arx nodes prune account state history, via a configurable time window. If the requested ledger version has been pruned, the server responds with a 410.
-}
getAccountResource : String -> String -> Maybe String -> D.Decoder object -> Api.Request (Data.MoveResource object)
getAccountResource address_path resourceType_path ledgerVersion_query decoder =
    Api.request
        "GET"
        "/accounts/{address}/resource/{resource_type}"
        [ ( "address", identity address_path ), ( "resource_type", identity resourceType_path ) ]
        [ ( "ledger_version", Maybe.map identity ledgerVersion_query ) ]
        []
        Nothing
        (Data.moveResourceDecoder decoder)



{-| Retrieves all account resources for a given account and a specific ledger version.  If the ledger version is not specified in the request, the latest ledger version is used.  The Arx nodes prune account state history, via a configurable time window. If the requested ledger version has been pruned, the server responds with a 410.
-}
getAccountResources : String -> Maybe String -> Maybe String -> Maybe Int -> D.Decoder object -> Api.Request (List (Data.MoveResource object))
getAccountResources address_path ledgerVersion_query start_query limit_query decoder =
    Api.request
        "GET"
        "/accounts/{address}/resources"
        [ ( "address", identity address_path ) ]
        [ ( "ledger_version", Maybe.map identity ledgerVersion_query ), ( "start", Maybe.map identity start_query ), ( "limit", Maybe.map String.fromInt limit_query ) ]
        []
        Nothing
        (D.list (Data.moveResourceDecoder decoder))
