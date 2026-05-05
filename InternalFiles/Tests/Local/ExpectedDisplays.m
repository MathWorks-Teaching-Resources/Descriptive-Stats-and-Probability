classdef ExpectedDisplays < matlab.unittest.TestCase

    % If you expect all your files to be output inline, no changes needed

    % If you expect all your files to be hidden code, change DispCheck to
    % run the test HiddenDispTest instead of InlineDispTest
    
    % If you have a mix, set the default version to whichever you have more
    % of and make a list of the exceptions as switch cases in DispCheck
    
    properties (ClassSetupParameter)
        Project = {char(currentProject().Name)};
    end

    properties (TestParameter)
        Scripts;
    end

    methods (TestParameterDefinition,Static)

        function Scripts = GetScriptName(Project)
            RootFolder = currentProject().RootFolder;
            Scripts = dir(fullfile(RootFolder,"Scripts","*.mlx"));
            Scripts = {Scripts.name};
        end

    end

    methods (TestClassSetup)

        function SetUpDispTest(testCase,Project)
            try
               currentProject;  
            catch ME
                warning("Project is not loaded.")
            end
        end

    
    end


    
    methods(Test)

        function DispCheck(testCase,Scripts)
            Filename = string(Scripts);
            switch (Filename)
                otherwise
                    InlineDispTest(testCase,Filename)
            end
        end
            
    end


    methods (Access = private)

        function InlineDispTest(testCase,Filename)
            assert(CheckDisplayStyle(Filename)=="Inline",Filename + " is not set to Inline.")
        end

        function HiddenDispTest(testCase,Filename)
            assert(CheckDisplayStyle(Filename)=="Hidden",Filename + " is not set to Hidden.")
        end

    end

    methods (TestClassTeardown)

    end % methods (TestClassTeardown)

end

%[appendix]
%---
