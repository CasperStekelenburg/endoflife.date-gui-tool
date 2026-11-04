# End-of-Life Product Checker

A Windows Forms GUI application for checking End-of-Life (EOL) information for various software products using the [endoflife.date API](https://endoflife.date/). This tool makes it easy to track when your software products and dependencies will reach end of support.

## Features

- 🔍 **Search & Filter**: Quickly search through hundreds of products and versions
- 📊 **Detailed Information**: View comprehensive EOL dates, version history, and support timelines
- 📋 **Batch Selection**: Select multiple products to view side-by-side
- 📁 **Excel Export**: Export selected products and their EOL information to Excel spreadsheets
- 🎨 **User-Friendly GUI**: Windows Forms interface for easy navigation
- 🔄 **Real-time Updates**: Fetches the latest data from the endoflife.date API

## Requirements

- Windows operating system with .NET Framework (included in most Windows installations)
- PowerShell 5.0 or later
- Internet connection for API access
- **Optional**: ImportExcel module for Excel export functionality (automatically installed if needed)

## Installation

### Option 1: Run PowerShell Script
1. Clone or download this repository
2. Open PowerShell as Administrator
3. Navigate to the repository directory
4. Run the script:
   ```powershell
   .\Get-EndOfLife-GUI.ps1
   ```

### Option 2: Use Compiled Executable
1. Download the latest release containing `End-of-Life Product Checker.exe`
2. Run the executable directly (no PowerShell required)

## Usage

1. **Launch the Application**: Run the script or executable
2. **Search for Products**: Use the search box to find specific products
3. **Select Products**: Click on products in the list to view their details
4. **View Details**: The right panel displays comprehensive EOL information including:
   - Release dates
   - End-of-life dates
   - Support status
   - Version information
5. **Export to Excel**: Select products and use the export function to create Excel reports

## Building from Source

To compile the PowerShell script into a standalone executable:

```powershell
.\compile.ps1
```

This will generate `End-of-Life Product Checker.exe` in the `dist` folder.

## Project Structure

```
endoflife.date-gui-tool/
├── Get-EndOfLife-GUI.ps1          # Main PowerShell script
├── compile.ps1                    # Build script for creating executable
├── applogo.ico                    # Application icon
├── End-of-Life Product Checker.exe # Compiled executable
├── README.md                      # This file
├── LICENSE                        # MIT License
└── dist/                         # Build output directory
```

## Credits

- Inspired by the article: [Retrieve End-of-Life Information Using PowerShell](https://powershellisfun.com/2025/03/07/retrieve-end-of-life-information-using-powershell/) by Harm Veenstra
- Data source: [endoflife.date](https://endoflife.date/) - A comprehensive database of end-of-life dates

## Author

**Casper Stekelenburg**
- Email: casper@dutchscriptingguys.com
- GitHub: [@CasperStekelenburg](https://github.com/CasperStekelenburg)

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Contributing

Contributions are welcome! Feel free to:
- Report bugs and issues
- Suggest new features
- Submit pull requests with improvements

## Changelog

### Version 0.0.0.0
- Initial release
- GUI for querying endoflife.date API
- Product search and filtering
- EOL information display
- Excel export functionality
