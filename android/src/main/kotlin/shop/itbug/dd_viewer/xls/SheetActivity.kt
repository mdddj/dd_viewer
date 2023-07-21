package shop.itbug.dd_viewer.xls

import android.app.Activity
import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.view.Menu
import android.view.MenuItem
import android.app.SearchManager
import android.content.Context
import android.net.Uri
import android.os.Build
import android.os.PersistableBundle
import android.util.AttributeSet
import android.util.Log
import android.view.View
import android.widget.TextView
import androidx.annotation.RequiresApi
import androidx.appcompat.widget.SearchView
import androidx.fragment.app.Fragment
import androidx.fragment.app.FragmentManager
import androidx.fragment.app.FragmentStatePagerAdapter
import androidx.lifecycle.ViewModelProvider
import androidx.lifecycle.ViewModelProviders
import androidx.viewpager.widget.ViewPager
import com.google.android.material.tabs.TabLayout
import shop.itbug.dd_viewer.R
import shop.itbug.dd_viewer.xls.spreadsheet.Spreadsheet
import shop.itbug.dd_viewer.xls.sheet.JumpToCellFragment
import shop.itbug.dd_viewer.xls.sheet.SheetAdapter
import shop.itbug.dd_viewer.xls.sheet.SheetFragment
import shop.itbug.dd_viewer.xls.sheet.SheetLayoutManager
import shop.itbug.dd_viewer.xls.sheet.SheetViewModel
import shop.itbug.dd_viewer.xls.sheet.SheetViewPager
import java.lang.Exception


class SheetActivity : AppCompatActivity() {

    private lateinit var mPager: SheetViewPager
    private var mSpreadsheetStatePagerAdapter: SpreadsheetStatePagerAdapter? = null

    var tabCount = 1

    private var selectedTab = 0

    private val MY_REQ_READ_EXTERNAL_STORAGE : Int = 93 // random magic number

    var lastSearch : LastSearch = resetLastSearch()

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

        setContentView(R.layout.tab_activity)

        tabSetup()

        val viewModel = ViewModelProvider(this)[SheetViewModel::class.java]

        viewModel.sheetLoadState.observe(this) {
            postSpreadsheetLoad()
        }

        checkViewIntents(intent)



    }


    private fun checkViewIntents(intent: Intent?) {
        if (intent == null) return
        val action = intent.action
        if (Intent.ACTION_VIEW == action) {
            val type = intent.type
            if (type != null) {
                val uri = intent.data
                if (uri != null) {
                    val csvMime = "text/comma-separated-values"
                    val odsMime = "application/vnd.oasis.opendocument.spreadsheet"
                    val xlsMime = "application/vnd.ms-excel"
                    val xlsxMime = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet"

                    when (type) {
                        csvMime -> {
                            handleViewIntent(uri)
                        }
                        odsMime -> {
                            handleViewIntent(uri)
                        }
                        xlsMime, xlsxMime -> {
                            handleViewIntent(uri)
                        }
                    }
                }
            }
        }
        // else if (Intent.ACTION_SEARCH.equals(action))
    }

    private fun handleViewIntent(uri : Uri) {
        val viewModel = ViewModelProvider(this)[SheetViewModel::class.java]
        viewModel.processUri(uri, contentResolver)
        postSpreadsheetLoad()
    }

    private fun tabSetup() {

        val numberOfTabs = tabCount

        val tabLayout = findViewById<View>(R.id.tab_layout) as TabLayout
        val tab = arrayOfNulls<TabLayout.Tab>(numberOfTabs)

        for (i in 0 until numberOfTabs) {
            tab[i] = tabLayout.newTab()
        }

        for (i in 0 until numberOfTabs) {
            tabLayout.addTab(tab[i]!!)
        }

        // create Fragment Pager Adapter
        //FragmentManager.enableDebugLogging(true);

        mSpreadsheetStatePagerAdapter = SpreadsheetStatePagerAdapter(
            supportFragmentManager)

        mPager = findViewById(R.id.view_pager)

        // attach adapter to viewpager
        mPager.adapter = mSpreadsheetStatePagerAdapter

        // attach viewpager to tab layout
        tabLayout.setupWithViewPager(mPager)

        // action to do when page changed
        setViewPagerListener(mPager)
    }

    private fun postSpreadsheetLoad() {
        val viewModel = ViewModelProvider(this)[SheetViewModel::class.java]

        val spreadsheet = viewModel.spreadsheet.value

        if (spreadsheet != null) {

            val tableCount = spreadsheet.workbook.sheetList.size

            val list = mutableListOf<String>()

            for (i in 0 until tableCount) {
                val name = spreadsheet.workbook.sheetList[i].name
                list.add(name)
            }

            val tabLayout = findViewById<View>(R.id.tab_layout) as TabLayout
            val tab = arrayOfNulls<TabLayout.Tab>(tableCount)

            mSpreadsheetStatePagerAdapter?.setNames(list)

            mSpreadsheetStatePagerAdapter?.notifyDataSetChanged()

            tabLayout.removeAllTabs()

            for (i in 0 until tableCount) {
                val name = spreadsheet.workbook.sheetList[i].name
                val newTab = tabLayout.newTab()
                newTab.text = name
                tab[i] = newTab
            }

            for (i in 0 until tableCount) {
                tabLayout.addTab(tab[i]!!)
            }

            tabCount = tableCount


            mSpreadsheetStatePagerAdapter?.notifyDataSetChanged()


        }


    }

    private fun setViewPagerListener(mPager: SheetViewPager) {

        mPager.addOnPageChangeListener(object : ViewPager.OnPageChangeListener {

            override fun onPageSelected(position: Int) {
                tabSelected(position)
            }

            override fun onPageScrolled(position: Int, positionOffset: Float, positionOffsetPixels: Int) {}

            override fun onPageScrollStateChanged(state: Int) {}
        })
    }

    private fun tabSelected(position: Int) {
        selectedTab = position

        val viewModel = ViewModelProvider(this)[SheetViewModel::class.java]
        viewModel.topRow = 1
        viewModel.leftColumn = 1
        SheetLayoutManager.topRow = 1
        SheetLayoutManager.leftColumn = 1

        val spreadsheet = viewModel.spreadsheet.value

        spreadsheet?.workbook?.currentSheet = selectedTab

        val frag = mSpreadsheetStatePagerAdapter?.instantiateItem(mPager, mPager.currentItem) as SheetFragment

        val sheetAdapter = frag.fragmentRecyclerView.adapter as SheetAdapter


        sheetAdapter.notifyDataSetChanged()

    }


    @RequiresApi(Build.VERSION_CODES.KITKAT)
    override fun onOptionsItemSelected(item: MenuItem): Boolean {
        return when (item.itemId) {
            R.id.action_jump -> {
                jumpDialog()
                true
            }

            R.id.action_search -> {
                true
            }

            R.id.action_load -> {
                load()
                true
            }

            else -> super.onOptionsItemSelected(item)
        }
    }

    private fun jumpDialog() {
        val newFragment = JumpToCellFragment()
        newFragment.show(supportFragmentManager, "jump")
    }


    @RequiresApi(Build.VERSION_CODES.KITKAT)
    fun load() {

        val viewModel = ViewModelProvider(this)[SheetViewModel::class.java]
        viewModel.topRow = 1
        viewModel.leftColumn = 1
        SheetLayoutManager.topRow = 1
        SheetLayoutManager.leftColumn = 1

        val intent = Intent(Intent.ACTION_OPEN_DOCUMENT).apply {
            addCategory(Intent.CATEGORY_OPENABLE)
            type = "*/*"
        }
        startActivityForResult(intent, MY_REQ_READ_EXTERNAL_STORAGE)
    }

    private fun clearSelectBox() {
        findViewById<TextView>(R.id.select).text = ""
    }

    override fun onActivityResult(requestCode: Int, resultCode: Int, data: Intent?) {
        super.onActivityResult(requestCode, resultCode, data)
        if (resultCode == Activity.RESULT_OK) {

            ///开始打开文件
            if (requestCode == MY_REQ_READ_EXTERNAL_STORAGE) {
                clearSelectBox()
                data?.data?.also { uri ->
                    handleUri(uri)
                }
            }
        }
    }

    ///处理文档
    private fun handleUri(uri: Uri) {
        Log.d("文档打开",uri.toString())
        val frag = mSpreadsheetStatePagerAdapter?.instantiateItem(mPager, mPager.currentItem) as SheetFragment
        frag.processUri()

        val viewModel = ViewModelProviders.of(this)[SheetViewModel::class.java]
        viewModel.processUri(uri, contentResolver)
    }


    override fun onNewIntent(intent: Intent?) {
        super.onNewIntent(intent)
        checkViewIntents(intent)
    }


    fun search(string: String) {

        val viewModel = ViewModelProvider(this)[SheetViewModel::class.java]
        val sheet = viewModel.spreadsheet.value

        sheet?.let {
            val searchData = SearchData(string, it, lastSearch)
            SearchTask(this).execute(searchData)
        }
    }

    fun doSearchJump() {
        val viewModel = ViewModelProvider(this)[SheetViewModel::class.java]

        // need to add space for column and row markers
        viewModel.leftColumn = lastSearch.column+1
        viewModel.topRow = lastSearch.row+1

        val fragment = mSpreadsheetStatePagerAdapter?.instantiateItem(mPager, mPager.currentItem) as SheetFragment
        fragment.processSearchJump()
    }

    private fun resetLastSearch() : LastSearch {
        return LastSearch(0,0,"")
    }

    fun getSheetString() : String {
        return getString(R.string.sheet)
    }

    data class SearchData(val string: String, val sheet: Spreadsheet, val lastSearch: LastSearch)
    data class LastSearch(val row: Int, val column: Int, val word: String)

    inner class SpreadsheetStatePagerAdapter(fragmentManager: FragmentManager) :
            FragmentStatePagerAdapter(fragmentManager) {

        private var nameList : MutableList<String> = mutableListOf()

        fun setNames(list : MutableList<String>) {
            nameList = list
        }

        override fun getItem(position: Int): Fragment {

            return SheetFragment.newInstance()
        }

        override fun getPageTitle(position: Int): CharSequence? {

            val titlePos = position + 1

            if (nameList.size > position) {

                val n = nameList[position]
                return n
            } else {
                val sheetString = getSheetString()
                return "$sheetString $titlePos"
            }
        }

        override fun getCount(): Int {
            return tabCount
        }

    }

}