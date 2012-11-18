/* -*- Mode: C; tab-width: 8; indent-tabs-mode: nil; c-basic-offset: 4 -*-
 *
 * ***** BEGIN LICENSE BLOCK *****
 * Version: MPL 1.1/GPL 2.0/LGPL 2.1
 *
 * The contents of this file are subject to the Mozilla Public License Version
 * 1.1 (the "License"); you may not use this file except in compliance with
 * the License. You may obtain a copy of the License at
 * http://www.mozilla.org/MPL/
 *
 * Software distributed under the License is distributed on an "AS IS" basis,
 * WITHOUT WARRANTY OF ANY KIND, either express or implied. See the License
 * for the specific language governing rights and limitations under the
 * License.
 *
 * The Original Code is JavaScript Lint code.
 *
 * The Initial Developer of the Original Code is Matthias Miller.
 * Portions created by the Initial Developer are Copyright (C) 2006
 * the Initial Developer. All Rights Reserved.
 *
 * Contributor(s):
 *
 * Alternatively, the contents of this file may be used under the terms of
 * either of the GNU General Public License Version 2 or later (the "GPL"),
 * or the GNU Lesser General Public License Version 2.1 or later (the "LGPL"),
 * in which case the provisions of the GPL or the LGPL are applicable instead
 * of those above. If you wish to allow use of your version of this file only
 * under the terms of either the GPL or the LGPL, and not to allow others to
 * use your version of this file under the terms of the MPL, indicate your
 * decision by deleting the provisions above and replace them with the notice
 * and other provisions required by the GPL or the LGPL. If you do not delete
 * the provisions above, a recipient may use your version of this file under
 * the terms of any one of the MPL, the GPL or the LGPL.
 *
 * ***** END LICENSE BLOCK ***** */

#ifndef _JAVASCRIPTLINTAPI_H__
#define _JAVASCRIPTLINTAPI_H__

#define JSL_IN
#define JSL_OUT

#include <xstring>

bool ExecuteProcess(std::string commandline, std::string input,
                    JSL_OUT std::string& output, JSL_OUT std::string& error);

// The Visual C++ compiler gives a warning when including <vector> because of debug symbols.
#pragma warning(push)
#pragma warning(disable: 4786)
#include <vector>
#pragma warning(pop)

// The return line and column is 0-based and may be -1 if the message does not apply to a specific
// line/column. The caller is responsible to do bounds-checking on the line/column.
struct JSLMessage
{
   std::string filename;
   int line, col;
   std::string errName, errType, errMessage;
};

class JavaScriptLint
{
public:
   // The path to the configuration file may be blank. 
   JavaScriptLint(std::string sBinaryPath, std::string sConfigPath);

   bool LintString(std::string code, JSL_OUT std::vector<JSLMessage>& messages,
      JSL_OUT std::string& error);
   bool LintFile(std::string file, JSL_OUT std::vector<JSLMessage>& messages,
      JSL_OUT std::string& error);
   bool LintFiles(std::vector<std::string> files, JSL_OUT std::vector<JSLMessage>& messages,
      JSL_OUT std::string& error);

private:
   bool RunLint(const std::vector<std::string>& files, bool useStdin, std::string code,
      JSL_OUT std::vector<JSLMessage>& messages, JSL_OUT std::string& error);

   std::string m_binaryPath, m_configPath;
};


#endif

