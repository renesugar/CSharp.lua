-- Generated by CSharp.lua Compiler 1.0.0.0
local System = System;
local CSharpLuaLuaAst;
System.usingDeclare(function (global) 
    CSharpLuaLuaAst = CSharpLua.LuaAst;
end);
System.namespace("CSharpLua.LuaAst", function (namespace) 
    namespace.class("LuaWrapFunctionStatementSynatx", function (namespace) 
        local UpdateIdentifiers, AddMemberDeclaration, Render, __ctor__;
        UpdateIdentifiers = function (this, name, target, memberName, parameter) 
            local memberAccess = CSharpLuaLuaAst.LuaMemberAccessExpressionSyntax(target, memberName);
            local invoke = CSharpLuaLuaAst.LuaInvocationExpressionSyntax:new(1, memberAccess);
            invoke:AddArgument(CSharpLuaLuaAst.LuaStringLiteralExpressionSyntax:new(1, name));
            invoke:AddArgument(this.function_);
            if parameter ~= nil then
                this.function_:AddParameter(parameter);
            end
            this.Statement = CSharpLuaLuaAst.LuaExpressionStatementSyntax(invoke);
        end;
        AddMemberDeclaration = function (this, statement) 
            if statement == nil then
                System.throw(System.ArgumentNullException("statement"));
            end
            this.statements_:Add(statement);
        end;
        Render = function (this, renderer) 
            this.function_:AddStatements(this.statements_);
            renderer:Render1(this);
        end;
        __ctor__ = function (this) 
            this.function_ = CSharpLuaLuaAst.LuaFunctionExpressionSyntax();
            this.statements_ = System.List(CSharpLuaLuaAst.LuaStatementSyntax)();
        end;
        return {
            __inherits__ = {
                CSharpLuaLuaAst.LuaStatementSyntax
            }, 
            UpdateIdentifiers = UpdateIdentifiers, 
            AddMemberDeclaration = AddMemberDeclaration, 
            Render = Render, 
            __ctor__ = __ctor__
        };
    end);
end);