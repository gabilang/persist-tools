// AUTO-GENERATED FILE. DO NOT MODIFY.

// This file is an auto-generated file by Ballerina persistence layer for model.
// It should not be modified by hand.

import ballerina/persist;
import ballerina/jballerina.java;
import ballerinax/mysql;
import ballerinax/mysql.driver as _;
import ballerinax/persist.sql as psql;

const MEDICAL_NEED = "medicalneeds";
const MEDICAL_ITEM = "medicalitems";

public isolated client class Client {
    *persist:AbstractPersistClient;

    private final mysql:Client dbClient;

    private final map<psql:SQLClient> persistClients;

    private final record {|psql:SQLMetadata...;|} & readonly metadata = {
        [MEDICAL_NEED] : {
            entityName: "MedicalNeed",
            tableName: "MedicalNeed",
            fieldMetadata: {
                needId: {columnName: "needId"},
                itemId: {columnName: "itemId"},
                beneficiaryId: {columnName: "beneficiaryId"},
                period: {columnName: "period"},
                urgency: {columnName: "urgency"},
                quantity: {columnName: "quantity"}
            },
            keyFields: ["needId"]
        },
        [MEDICAL_ITEM] : {
            entityName: "MedicalItem",
            tableName: "MedicalItem",
            fieldMetadata: {
                itemId: {columnName: "itemId"},
                name: {columnName: "name"},
                'type: {columnName: "type"},
                unit: {columnName: "unit"}
            },
            keyFields: ["itemId"]
        }
    };

    public isolated function init() returns persist:Error? {
        mysql:Client|error dbClient = new (host = host, user = user, password = password, database = database, port = port, options = connectionOptions);
        if dbClient is error {
            return <persist:Error>error(dbClient.message());
        }
        self.dbClient = dbClient;
        self.persistClients = {
            [MEDICAL_NEED] : check new (dbClient, self.metadata.get(MEDICAL_NEED), psql:MYSQL_SPECIFICS),
            [MEDICAL_ITEM] : check new (dbClient, self.metadata.get(MEDICAL_ITEM), psql:MYSQL_SPECIFICS)
        };
    }

    isolated resource function get medicalneeds(MedicalNeedTargetType targetType = <>) returns stream<targetType, persist:Error?> = @java:Method {
        'class: "io.ballerina.stdlib.persist.sql.datastore.MySQLProcessor",
        name: "query"
    } external;

    isolated resource function get medicalneeds/[int needId](MedicalNeedTargetType targetType = <>) returns targetType|persist:Error = @java:Method {
        'class: "io.ballerina.stdlib.persist.sql.datastore.MySQLProcessor",
        name: "queryOne"
    } external;

    isolated resource function post medicalneeds(MedicalNeedInsert[] data) returns int[]|persist:Error {
        psql:SQLClient sqlClient;
        lock {
            sqlClient = self.persistClients.get(MEDICAL_NEED);
        }
        _ = check sqlClient.runBatchInsertQuery(data);
        return from MedicalNeedInsert inserted in data
            select inserted.needId;
    }

    isolated resource function put medicalneeds/[int needId](MedicalNeedUpdate value) returns MedicalNeed|persist:Error {
        psql:SQLClient sqlClient;
        lock {
            sqlClient = self.persistClients.get(MEDICAL_NEED);
        }
        _ = check sqlClient.runUpdateQuery(needId, value);
        return self->/medicalneeds/[needId].get();
    }

    isolated resource function delete medicalneeds/[int needId]() returns MedicalNeed|persist:Error {
        MedicalNeed result = check self->/medicalneeds/[needId].get();
        psql:SQLClient sqlClient;
        lock {
            sqlClient = self.persistClients.get(MEDICAL_NEED);
        }
        _ = check sqlClient.runDeleteQuery(needId);
        return result;
    }

    isolated resource function get medicalitems(MedicalItemTargetType targetType = <>) returns stream<targetType, persist:Error?> = @java:Method {
        'class: "io.ballerina.stdlib.persist.sql.datastore.MySQLProcessor",
        name: "query"
    } external;

    isolated resource function get medicalitems/[int itemId](MedicalItemTargetType targetType = <>) returns targetType|persist:Error = @java:Method {
        'class: "io.ballerina.stdlib.persist.sql.datastore.MySQLProcessor",
        name: "queryOne"
    } external;

    isolated resource function post medicalitems(MedicalItemInsert[] data) returns int[]|persist:Error {
        psql:SQLClient sqlClient;
        lock {
            sqlClient = self.persistClients.get(MEDICAL_ITEM);
        }
        _ = check sqlClient.runBatchInsertQuery(data);
        return from MedicalItemInsert inserted in data
            select inserted.itemId;
    }

    isolated resource function put medicalitems/[int itemId](MedicalItemUpdate value) returns MedicalItem|persist:Error {
        psql:SQLClient sqlClient;
        lock {
            sqlClient = self.persistClients.get(MEDICAL_ITEM);
        }
        _ = check sqlClient.runUpdateQuery(itemId, value);
        return self->/medicalitems/[itemId].get();
    }

    isolated resource function delete medicalitems/[int itemId]() returns MedicalItem|persist:Error {
        MedicalItem result = check self->/medicalitems/[itemId].get();
        psql:SQLClient sqlClient;
        lock {
            sqlClient = self.persistClients.get(MEDICAL_ITEM);
        }
        _ = check sqlClient.runDeleteQuery(itemId);
        return result;
    }

    public isolated function close() returns persist:Error? {
        error? result = self.dbClient.close();
        if result is error {
            return <persist:Error>error(result.message());
        }
        return result;
    }
}

