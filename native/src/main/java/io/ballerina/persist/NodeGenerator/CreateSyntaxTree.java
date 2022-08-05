/*
 *  Copyright (c) 2022, WSO2 Inc. (http://www.wso2.org) All Rights Reserved.
 *
 *  WSO2 Inc. licenses this file to you under the Apache License,
 *  Version 2.0 (the "License"); you may not use this file except
 *  in compliance with the License.
 *  You may obtain a copy of the License at
 *
 *    http://www.apache.org/licenses/LICENSE-2.0
 *
 *  Unless required by applicable law or agreed to in writing,
 *  software distributed under the License is distributed on an
 *  "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
 *  KIND, either express or implied.  See the License for the
 *  specific language governing permissions and limitations
 *  under the License.
 */

package io.ballerina.persist.nodegenerator;

import io.ballerina.toml.syntax.tree.AbstractNodeFactory;
import io.ballerina.toml.syntax.tree.DocumentMemberDeclarationNode;
import io.ballerina.toml.syntax.tree.DocumentNode;
import io.ballerina.toml.syntax.tree.NodeFactory;
import io.ballerina.toml.syntax.tree.NodeList;
import io.ballerina.toml.syntax.tree.SyntaxTree;
import io.ballerina.toml.syntax.tree.Token;
import io.ballerina.toml.validator.SampleNodeGenerator;
import io.ballerina.tools.text.TextDocument;
import io.ballerina.tools.text.TextDocuments;

import java.io.PrintStream;


/**
 * Class to create syntax tree for ballerina.
 */
public class CreateSyntaxTree {
    private static final PrintStream outStream = System.out;
    public static SyntaxTree createToml() {

        NodeList<DocumentMemberDeclarationNode> moduleMembers = AbstractNodeFactory.createEmptyNodeList();
        moduleMembers = moduleMembers.add(SampleNodeGenerator.createStringKV("provider", "mysql", null));
        moduleMembers = moduleMembers.add(SampleNodeGenerator.createStringKV("host", "localhost", null));
        moduleMembers = moduleMembers.add(SampleNodeGenerator.createNumericKV("port", "3306", null));
        moduleMembers = moduleMembers.add(SampleNodeGenerator.createStringKV("user", "root", null));
        moduleMembers = moduleMembers.add(SampleNodeGenerator.createStringKV("password", "", null));
        moduleMembers = moduleMembers.add(SampleNodeGenerator.createStringKV("database", "", null));
        Token eofToken = AbstractNodeFactory.createIdentifierToken("");
        DocumentNode documentNode = NodeFactory.createDocumentNode(moduleMembers, eofToken);

        TextDocument textDocument = TextDocuments.from(documentNode.toSourceCode());
        SyntaxTree syntaxTree = SyntaxTree.from(textDocument);
        return syntaxTree;
    }
}
