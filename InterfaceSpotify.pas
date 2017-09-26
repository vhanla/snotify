unit InterfaceSpotify;

interface

type
  ISpotify = interface
    ['{F554FBA5-81A9-453B-A7CA-FEB6C9BEBF71}']
    function GetSpotifyPath: string;
    property Path: string read GetSpotifyPath;
  end;

implementation

end.
