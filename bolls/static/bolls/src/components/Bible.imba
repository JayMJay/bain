import "./translations_books.json" as BOOKS
import "./languages.json" as languages
import {Profile} from './Profile'
import {Load} from "./loading.imba"
import {Downloads} from "./downloads.imba"
require "./compare-draggable-item"
require './search-text-as-html'
require './text-as-html'
import {thanks_to} from './thanks_to'

let translations = []
for language in languages
	translations = translations.concat(language:translations)

let settings = {
	theme: 'light',
	accent: 'blue',
	translation: 'YLT',
	book: 1,
	chapter: 1,
	font: {
		size: window:innerWidth > 512 ? 24 : 20,
		family: "sans, sans-serif",
		name: "Sans Serif",
		line-height: window:innerWidth > 512 ? 2 : 1.8,
		weight: 400,
		max-width: 30,
	},
	verse_break: no,
	lock_drawers: no,
	verse_picker: no,
	transitions: yes
}
let settingsp = {
	display: no,
	translation: 'WLCC',
	book: 1,
	chapter: 1,
	edited_version: settings:translatoin,
}
let inzone = no
let onzone = no
let bible_menu_left = -300
let settings_menu_left = -300
let choosen = []
let choosenid = []
let highlight_color = ''
let highlights = []
let show_color_picker = no
let show_collections = no
let show_history = no
let choosen_parallel = no
let store = {newcollection: '', book_search: ''}
let addcollection = no
let choosen_categories = []
let onpopstate = no
let loading = no
let menuicons = yes
let show_fonts = no
let show_accents = no
let show_help = no
let show_support = no
let show_compare = no
let show_verse_picker = no
let show_parallel_verse_picker = no
let show_downloads = no
let show_language_of = ''
let show_share_box = no
let what_to_show = 'search'
let deleting_of_all_transllations = no
let choosen_for_comparison = []
let comparison_parallel = []
let new_comparison_parallel = []
let show_translations_for_comparison = no
let was_deleting_translation_from_compare = no
let compare_translations = []
let compare_parallel_of_chapter
let compare_parallel_of_book
let highlighted_title = ''
let svg_paths = {
	close: "M10 8.586L2.929 1.515 1.515 2.929 8.586 10l-7.071 7.071 1.414 1.414L10 11.414l7.071 7.071 1.414-1.414L11.414 10l7.071-7.071-1.414-1.414L10 8.586z",
	copy: "M395.25,0h-306c-28.05,0-51,22.95-51,51v357h51V51h306V0z M471.75,102h-280.5c-28.05,0-51,22.95-51,51v357	c0,28.05,22.95,51,51,51h280.5c28.05,0,51-22.95,51-51V153C522.75,124.95,499.8,102,471.75,102z M471.75,510h-280.5V153h280.5V510 z",
	loading: "M7.979 1.055a1.474 1.474 0 0 0-.27.025c-3 .16-5.627 2.222-6.451 5.129A7.13 7.13 0 0 0 4.5 14.037a7.13 7.13 0 0 0 8.4-1.105 7.13 7.13 0 0 0 1.106-8.4c1.507 2.725 1.032 6.162-1.135 8.37-2.228 2.148-5.654 2.577-8.33 1.065-2.618-1.576-3.914-4.73-3.18-7.672-.708 2.948.623 6.072 3.221 7.601 2.654 1.471 6.026 1.005 8.174-1.109 2.094-2.168 2.514-5.528 1.037-8.133 1.453 2.618.992 5.956-1.096 8.075-2.137 2.067-5.464 2.484-8.033 1.025C2.146 12.244.888 9.182 1.6 6.357c-.685 2.832.604 5.863 3.103 7.327 2.547 1.417 5.821.963 7.88-1.07 2.014-2.078 2.42-5.34.997-7.837 1.4 2.51.951 5.75-1.056 7.778-2.048 1.988-5.276 2.391-7.737.986C2.37 12.098 1.15 9.125 1.838 6.418c-.662 2.714.59 5.655 2.988 7.053 2.439 1.363 5.614.923 7.582-1.032 1.935-1.987 2.329-5.152.96-7.54 1.345 2.402.91 5.544-1.018 7.482-1.958 1.908-5.089 2.299-7.442.947C2.59 11.951 1.411 9.071 2.076 6.48c-.639 2.598.574 5.446 2.873 6.778 2.331 1.31 5.408.882 7.286-.992 1.855-1.898 2.235-4.963.92-7.245 1.292 2.295.869 5.338-.979 7.186-1.867 1.829-4.9 2.206-7.145.908-2.219-1.31-3.36-4.1-2.718-6.574-.616 2.48.56 5.238 2.76 6.504 2.223 1.256 5.2.842 6.988-.953 1.775-1.807 2.143-4.774.88-6.947 1.239 2.187.83 5.13-.939 6.888-1.777 1.75-4.71 2.114-6.847.87-2.12-1.246-3.223-3.943-2.604-6.3-.593 2.364.544 5.03 2.645 6.229 2.115 1.203 4.993.801 6.69-.914 1.697-1.717 2.051-4.585.843-6.65 1.184 2.08.788 4.924-.9 6.591-1.688 1.67-4.522 2.021-6.551.83-2.02-1.179-3.085-3.785-2.489-6.025-.57 2.247.53 4.822 2.53 5.955 2.007 1.15 4.786.76 6.394-.875 1.616-1.627 1.958-4.395.803-6.353 1.131 1.971.747 4.717-.861 6.295-1.597 1.59-4.332 1.927-6.254.79-1.92-1.113-2.947-3.628-2.373-5.751-.547 2.13.513 4.614 2.414 5.681 1.9 1.096 4.58.72 6.097-.836 1.537-1.536 1.865-4.206.764-6.056 1.077 1.864.707 4.51-.822 5.998-1.507 1.51-4.143 1.835-5.957.752-1.82-1.047-2.808-3.47-2.258-5.477-.524 2.013.498 4.405 2.299 5.406 1.792 1.042 4.373.68 5.8-.797 1.457-1.446 1.773-4.016.725-5.76 1.024 1.757.666 4.305-.783 5.702-1.417 1.43-3.953 1.742-5.66.713-1.721-.981-2.672-3.314-2.145-5.203-.5 1.896.484 4.197 2.186 5.132 1.684.989 4.166.64 5.504-.757 1.377-1.357 1.68-3.828.685-5.463.97 1.649.626 4.097-.744 5.404-1.326 1.35-3.764 1.65-5.363.674-1.621-.915-2.534-3.155-2.03-4.928-.477 1.78.47 3.988 2.07 4.858 1.578.934 3.96.598 5.208-.72 1.297-1.266 1.587-3.638.646-5.165.917 1.54.585 3.89-.705 5.107-1.236 1.271-3.575 1.557-5.066.635-1.522-.849-2.395-2.999-1.914-4.654-.455 1.662.453 3.779 1.955 4.582 1.469.88 3.752.557 4.908-.68 1.217-1.176 1.494-3.447.607-4.865.875 1.425.577 3.685-.636 4.836-1.15 1.213-3.411 1.51-4.836.636-1.47-.797-2.343-2.904-1.867-4.507.39-1.626 2.197-3.013 3.869-2.97V4a1.474 1.474 0 0 0 .002 0 1.474 1.474 0 0 0 1.472-1.473 1.474 1.474 0 0 0-1.472-1.472 1.474 1.474 0 0 0-.002 0z",
	download: "M19.35 10.04C18.67 6.59 15.64 4 12 4 9.11 4 6.6 5.64 5.35 8.04 2.34 8.36 0 10.91 0 14c0 3.31 2.69 6 6 6h13c2.76 0 5-2.24 5-5 0-2.64-2.05-4.78-4.65-4.96zM17 13l-5 5-5-5h3V9h4v4h3z",
	columnssvg: "m 35.947269,15.059556 c -7.96909,0.761819 -16.598173,3.661819 -16.598173,5.578181 0,0.283637 -0.409098,0.516366 -0.9091,0.516366 -0.498179,0 -1.332722,0.650908 -1.854541,1.445453 -0.520001,0.794545 -2.256364,2.158182 -3.856366,3.03091 -4.285453,2.334544 -5.9854532,4.496361 -7.5981802,9.663636 -0.7927282,2.536363 -1.6272727,4.750909 -1.858182,4.921819 -0.2290916,0.170908 -1.0600004,2.521818 -1.8454543,5.225454 L 0,50.355921 V 169.00683 287.65774 l 1.4272725,4.91455 c 0.7854539,2.70181 1.6163627,5.05454 1.8454543,5.22545 0.2309093,0.17092 1.0654538,2.38545 1.858182,4.92182 1.612727,5.16726 3.3127272,7.32728 7.5981802,9.66363 1.600002,0.87272 3.336365,2.23636 3.856366,3.03092 0.521819,0.79452 1.356362,1.44362 1.854541,1.44362 0.500002,0 0.9091,0.23274 0.9091,0.51819 0,0.97455 6.109083,3.84182 10.278172,4.82544 7.17819,1.69457 80.296372,1.94183 87.632732,0.29821 6.04365,-1.35455 8.16364,-2.48183 9.22727,-4.90546 0.40182,-0.9109 0.87272,-1.79637 1.04909,-1.96547 5.33636,-5.12908 5.2909,-24.29272 -0.0655,-26.3327 -0.29454,-0.11269 -0.53818,-0.51092 -0.53818,-0.88365 0,-1.3 -2.77638,-4.72909 -4.30183,-5.31455 -5.89455,-2.25456 -9.98909,-2.5109 -40.25998,-2.5109 -36.860001,0 -34.947277,0.51454 -36.567284,-9.83638 -0.858176,-5.48545 -0.858176,-198.001813 0,-203.489086 1.620007,-10.350909 -0.292717,-9.836364 36.567284,-9.836364 30.27089,0 34.36543,-0.254545 40.25998,-2.510908 1.52545,-0.583637 4.30183,-4.012727 4.30183,-5.312727 0,-0.374545 0.24364,-0.772727 0.53818,-0.885455 5.35636,-2.04 5.40181,-21.203636 0.0655,-26.332727 -0.17637,-0.16909 -0.64727,-1.052729 -1.04909,-1.965455 -1.05091,-2.392728 -3.17091,-3.545455 -8.92001,-4.845456 -5.51091,-1.245455 -69.73089,-1.650909 -81.619991,-0.512726 m 246.099981,0.529091 c -5.69089,1.21091 -7.93817,2.427274 -8.91452,4.829091 -0.37091,0.912726 -1.60183,3.692727 -2.73819,6.18 -4.27455,9.361817 0.24001,27.027273 7.3291,28.67091 8.94546,2.072725 10.49999,2.156362 40.21634,2.156362 36.34002,0 34.19274,-0.58909 35.82365,9.836364 0.85818,5.487273 0.85818,198.003636 0,203.489086 -1.63091,10.42546 0.51637,9.83638 -35.82365,9.83638 -29.71635,0 -31.27088,0.0836 -40.21634,2.15818 -7.08909,1.64182 -11.60365,19.30728 -7.3291,28.6709 1.13636,2.48545 2.36728,5.26729 2.73819,6.17819 2.17818,5.35636 7.25091,5.97636 48.99091,5.98726 47.96181,0.011 53.39271,-0.65817 60,-7.39999 1.30546,-1.33091 3.97272,-3.35817 5.92728,-4.50365 5.00909,-2.93636 5.34181,-3.44362 7.8509,-12.03272 1.23455,-4.22727 2.63636,-8.98183 3.11636,-10.56728 1.30909,-4.31999 1.30909,-235.82181 0,-240.143628 -0.48,-1.585453 -1.88181,-6.340002 -3.11636,-10.565455 -2.50909,-8.589091 -2.84181,-9.098182 -7.8509,-12.032726 -1.95456,-1.147273 -4.62182,-3.172728 -5.92728,-4.505456 -6.62545,-6.759999 -12.08,-7.425455 -60.30728,-7.359999 -30.57273,0.03999 -35.33819,0.174545 -39.76911,1.118181 M 87.376365,80.170465 c -4.607281,1.176365 -8.121816,2.990911 -9.203634,4.752728 -0.27636,0.44909 -2.036369,1.681818 -3.910908,2.740001 -5.672728,3.203638 -7.954555,10.047268 -6.37819,19.130916 0.736366,4.23454 3.161817,9.64908 4.325463,9.64908 0.30363,0 2.779992,1.52728 5.505453,3.39273 8.1709,5.59637 11.061814,6.05454 35.805451,5.66182 l 56.45636,-0.32 5.72727,-2.60364 c 7.41637,-3.37091 9.73092,-5.63089 13.21092,-12.89272 3.3909,-7.07273 3.38726,-7.00365 0.48909,-13.678187 -2.98546,-6.872727 -6.95455,-10.823637 -14.29275,-14.223636 l -5.09272,-2.36 -57.0909,-0.24 C 93.743646,78.957738 91.839989,79.032284 87.376365,80.170465 M 241.08363,79.512283 c -6.49817,0.452729 -11.56727,2.516364 -15.91091,6.474546 -1.22364,1.116365 -2.97454,2.685455 -3.89091,3.487273 -1.76363,1.540005 -6.18547,10.963628 -6.1509,13.103648 0.10547,6.45272 7.52182,15.68726 15.91999,19.81998 l 5.64364,2.7782 49.26727,0.30908 c 24.90001,0.38364 28.70364,-0.17455 35.30363,-5.16909 2.17092,-1.64362 4.80001,-3.34182 5.84364,-3.77272 7.77637,-3.22182 7.46546,-24.098185 -0.41817,-28.092735 -1.69818,-0.861818 -4.38547,-2.790907 -5.97272,-4.290908 -4.51637,-4.265455 -7.36,-4.769092 -27.79638,-4.927273 -9.29818,-0.07091 -48.62546,0.05455 -51.83818,0.279999 M 84.821812,148.3941 c -16.609086,1.92911 -23.163629,22.64728 -11.147262,35.23274 6.041815,6.32908 5.400001,6.20544 34.03271,6.47818 33.53273,0.31999 74.59455,-0.45455 77.58363,-6.79637 0.68002,-1.44182 2.23455,-4.10182 3.45275,-5.91092 3.30727,-4.90544 3.30727,-11.87635 0,-16.7818 -1.2182,-1.8091 -2.77273,-4.47092 -3.45275,-5.91274 -2.89271,-6.13636 -43.69271,-6.93272 -74.3418,-6.82 -12.341809,0.0454 -24.098174,0.27455 -26.127278,0.51091 m 148.270908,0.0309 c -1.52181,0.30546 -3.65453,0.71456 -4.73818,0.90909 -1.86183,0.33274 -6.94364,4.48182 -6.94364,5.66728 0,0.29636 -1.24546,2.43272 -2.76544,4.74908 -2.71274,4.1291 -2.76728,4.31274 -2.76728,9.25636 0,4.94365 0.0545,5.12546 2.76728,9.25455 1.51998,2.31638 2.76544,4.44183 2.76544,4.72184 0,0.8418 4.18183,4.75817 5.67818,5.31999 6.85637,2.57273 87.83092,2.74544 92.66909,0.21091 17.19273,-9.00365 17.19273,-29.98365 0,-39.02183 -2.79635,-1.46909 -80.21455,-2.36727 -86.66545,-1.06727 M 87.438188,213.56136 c -3.589094,0.91636 -5.980006,2.05274 -9.718182,4.61273 -2.727273,1.86727 -5.20728,3.39456 -5.51091,3.39456 -1.163646,0 -3.589097,5.41452 -4.325463,9.65091 -1.576365,9.08362 0.705462,15.92726 6.37819,19.12908 1.874539,1.05818 3.634548,2.2909 3.910908,2.73999 3.005456,4.89819 10.938184,6.20002 35.379999,5.81273 l 56.48909,-0.31818 5.07999,-2.35455 c 7.32544,-3.39453 11.29818,-7.34908 14.28183,-14.22 2.89817,-6.67272 2.90181,-6.60364 -0.48909,-13.67635 -3.48,-7.26546 -5.79455,-9.52181 -13.22183,-12.90002 l -5.74001,-2.60909 -57.05998,-0.23999 c -19.069101,-0.22 -21.067263,-0.14363 -25.454542,0.97818 m 153.645442,-0.62182 c -6.73272,0.44726 -13.41273,3.35091 -18.27818,7.94727 -2.64363,2.4982 -7.63273,11.95275 -7.67454,14.54728 -0.0345,2.14 4.38727,11.56364 6.1509,13.10546 0.91637,0.80181 2.70909,2.40909 3.98364,3.57091 1.27455,1.16181 4.41636,3.1109 6.98181,4.32909 l 4.66364,2.21455 50.3891,0.0545 c 25.75637,0.0654 28.65817,-0.35455 33.4109,-4.84727 1.59092,-1.50366 4.28183,-3.43821 5.98001,-4.29821 7.88363,-3.99454 8.19454,-24.87271 0.41817,-28.09271 -1.04363,-0.43272 -3.67272,-2.12911 -5.84181,-3.77273 -6.75273,-5.11092 -52.11091,-6.62546 -80.18364,-4.75819"
}
let fonts = [
	{
		name: "David Libre",
		code: "'David Libre', serif"
	},
	{
		name: "Bellefair",
		code: "'Bellefair', serif"
	},
	{
		name: "Tinos",
		code: "'Tinos', serif"
	},
	{
		name: "Roboto Slab",
		code: "'Roboto Slab', sans-serif"
	},
	{
		name: "System UI",
		code: "system-ui"
	}
	{
		name: "Sans Serif",
		code: "sans, sans-serif"
	},
	{
		name: "Monospace",
		code: "monospace"
	},
]
let accents = [
	{
		name: "green",
		light: '#9acd32',
		dark: '#9acd32'
	},
	{
		name: "blue",
		light: '#8080FF',
		dark: '#417690'
	},
	{
		name: "purple",
		light: '#984da5',
		dark: '#994EA6'
	},
	{
		name: "gold",
		light: '#DAA520',
		dark: '#E1AF33'
	},
	{
		name: "red",
		light: '#DE5454',
		dark: '#D93A3A'
	},
]

document:onkeyup = do |e|
	var e = e || window:event
	if document.getElementById("search") != document:activeElement && document.getSelection == ''
		if e:code == "ArrowRight" && e:altKey && e:ctrlKey
			let bible = document:getElementsByClassName("Bible")
			bible[0]:_tag.nextChapter('true')
		elif e:code == "ArrowLeft" && e:altKey && e:ctrlKey
			let bible = document:getElementsByClassName("Bible")
			bible[0]:_tag.prevChapter('true')
		elif e:code == "ArrowRight" && e:ctrlKey
			let bible = document:getElementsByClassName("Bible")
			bible[0]:_tag.nextChapter
		elif e:code == "ArrowLeft" && e:ctrlKey
			let bible = document:getElementsByClassName("Bible")
			bible[0]:_tag.prevChapter
		elif e:code == "KeyN" && e:altKey
			let bible = document:getElementsByClassName("Bible")
			bible[0]:_tag.nextBook
		elif e:code == "KeyP" && e:altKey
			let bible = document:getElementsByClassName("Bible")
			bible[0]:_tag.prevBook
	if e:code == "Escape"
		let bible = document:getElementsByClassName("Bible")
		bible[0]:_tag.clearSpace
		let profile = document:getElementsByClassName("Profile")
		if profile[0]
			profile[0]:_tag.orphanize
			window:history.back()
	if e:code == "KeyH" && e:altKey && e:ctrlKey
		menuicons = !menuicons
		Imba.commit
		window:localStorage.setItem("menuicons", menuicons)

window:onpopstate = do |event|
	let state = event:state
	if state
		if state:profile || state:downloads
			if state:profile
				let profile = document:getElementsByClassName("Profile")
				if !profile[0]
					Imba.mount <Profile[@data]>
			if state:downloads
				let downloads = document:getElementsByClassName("Downloads")
				if !downloads[0]
					Imba.mount <Downloads[@data]>
		else
			onpopstate = yes
			let profile = document:getElementsByClassName("Profile")
			if profile[0]
				profile[0]:_tag.orphanize
			let downloads = document:getElementsByClassName("Downloads")
			if downloads[0]
				downloads[0]:_tag.orphanize

			let bible = document:getElementsByClassName("Bible")
			bible[0]:_tag.unflag("display_none")
			if state:parallel-translation && state:parallel-book && state:parallel-chapter
				bible[0]:_tag.getParallelText(state:parallel-translation, state:parallel-book, state:parallel-chapter, state:parallel-verse)
			bible[0]:_tag.getText(state:translation, state:book, state:chapter, state:verse)
			settingsp:display = state:parallel_display
			window:localStorage.setItem('parallel_display', state:parallel_display)

tag colorpicker < canvas
	prop imgData
	prop rgba

	def build
		self.width = 320
		self.height = 207
		let gradient = self:context('2d').createLinearGradient(0,0,self.width,0)
		gradient.addColorStop(0, '#ff0000')
		gradient.addColorStop(1/6, '#ffff00')
		gradient.addColorStop((1/6)*2, '#00ff00')
		gradient.addColorStop((1/6)*3, '#00ffff')
		gradient.addColorStop((1/6)*4, '#0000ff')
		gradient.addColorStop((1/6)*5, '#ff00ff')
		gradient.addColorStop(1, '#ff0000')
		self:context('2d'):fillStyle = gradient
		self:context('2d').fillRect(0, 0, self.width, self.height)

		gradient = self:context('2d').createLinearGradient(0,0,0,self.height)
		gradient.addColorStop(0, 'rgba(255, 255, 255, 1)')
		gradient.addColorStop(0.5, 'rgba(255, 255, 255, 0)')
		gradient.addColorStop(1, 'rgba(255, 255, 255, 0)')
		self:context('2d'):fillStyle = gradient
		self:context('2d').fillRect(0, 0, self.width, self.height)

		gradient = self:context('2d').createLinearGradient(0,0,0,self.height)
		gradient.addColorStop(0, 'rgba(0, 0, 0, 0)')
		gradient.addColorStop(0.5, 'rgba(0, 0, 0, 0)')
		gradient.addColorStop(1, 'rgba(0, 0, 0, 1)')
		self:context('2d'):fillStyle = gradient
		self:context('2d').fillRect(0, 0, self.width, self.height)

	def ontouchstart e
		let offsetX = (window:innerWidth - 320) / 2 + e:_x
		let offsetY = window:innerWidth <= 600 ? e:_y - (window:innerHeight - 209) : e:_y - (window:innerHeight - 383)
		@imgData = self:context('2d').getImageData(offsetX, offsetY, 1, 1)
		@rgba = @imgData:data
		highlight_color = "rgba(" + @rgba[0] + "," + @rgba[1] + "," + @rgba[2] + "," + @rgba[3] + ")"
		self

	def ontouchupdate e
		let offsetX = e:_x - ((window:innerWidth - 330) / 2)
		let offsetY = window:innerWidth <= 600 ? e:_y - (window:innerHeight - 209) : e:_y - (window:innerHeight - 383)
		@imgData = self:context('2d').getImageData(offsetX, offsetY, 1, 1)
		@rgba = @imgData:data
		highlight_color = "rgba(" + @rgba[0] + "," + @rgba[1] + "," + @rgba[2] + "," + @rgba[3] + ")"
		Imba.commit

	def onclick e
		@imgData = self:context('2d').getImageData(e:_event:offsetX, e:_event:offsetY, 1, 1)
		@rgba = @imgData:data
		highlight_color = "rgba(" + @rgba[0] + "," + @rgba[1] + "," + @rgba[2] + "," + @rgba[3] + ")"

	def render
		<self .show-canvas=show_color_picker>

export tag Bible
	prop verses default: []
	prop search_verses default: Object.create(null)
	prop parallel_bookmarks default: []
	prop parallel_verses default: []
	prop parallel_books default: []
	prop bookmarks default: []
	prop books default: []
	prop show_chapters_of default: 0
	prop show_list_of_translations default: no
	prop show_languages default: no
	prop history default: []
	prop categories default: []
	prop chronorder default: no
	prop search default: Object.create(null)

	def setup
		if window:translation
			if translations.find(do |element| return element:short_name == window:translation)
				setCookie('translation', window:translation)
				setCookie('book', window:book)
				setCookie('chapter', window:chapter)
				settings:translation = window:translation
				settings:book = window:book
				settings:chapter = window:chapter
				document:title += " " + getNameOfBookFromHistory(window:translation, window:book) + ' ' + window:chapter
				if window:verses
					@verses = window:verses
					getBookmarks("/get-bookmarks/" + window:translation + '/' + window:book + '/' + window:chapter + '/')
				if window:verse
					document:title += ':' + window:verse
					foundVerse(window:verse, "#{window:verse}")
				document:title += ' ' + window:translation
		if getCookie('theme')
			settings:theme = getCookie('theme')
			settings:accent = getCookie('accent') || settings:accent
			let html = document.querySelector('#html')
			html:dataset:theme = settings:accent + settings:theme
			html:dataset:light = settings:theme
		else
			let html = document.querySelector('#html')
			html:dataset:light = settings:theme
			html:dataset:theme = settings:accent + settings:theme
		if window:location:pathname == '/profile/' then toProfile yes
		elif window:location:pathname == '/downloads/'then toDownloads yes
		if getCookie('transitions') == 'false'
			settings:transitions = no
			let html = document.querySelector('#html')
			html:dataset:transitions = "false"
		settings:font:size = parseInt(getCookie('font')) || settings:font:size
		settings:font:family = getCookie('font-family') || settings:font:family
		settings:font:name = getCookie('font-name') || settings:font:name
		settings:font:weight = parseInt(getCookie('font-weight')) || settings:font:weight
		settings:font:line-height = parseFloat(getCookie('line-height')) || settings:font:line-height
		settings:font:max-width = parseInt(getCookie('max-width')) || settings:font:max-width
		settings:verse_picker = (getCookie('verse_picker') == 'true') || settings:verse_picker
		settings:verse_break = (getCookie('verse_break') == 'true') || settings:verse_break
		settings:lock_drawers = (getCookie('lock_drawers') == 'true') || settings:lock_drawers
		settings:translation = getCookie('translation') || settings:translation
		settings:book = parseInt(getCookie('book')) || settings:book
		settings:chapter = parseInt(getCookie('chapter')) || settings:chapter
		show_chapters_of = settings:book
		switchTranslation(settings:translation, no)
		getText(settings:translation, settings:book, settings:chapter)
		if getCookie('parallel_display') == 'true'
			toggleParallelMode("build")
		if window:navigator:onLine
			try
				let data = await loadData("/user-logged/")
				if data:username
					@data.user = data:username
					setCookie('username', @data.user)
					@history = JSON.parse(data:history)
					if @history:length then window:localStorage.setItem("history", JSON.stringify(@history))
				else @data.user = ''
			catch error
				console.error('Error: ', error)
				@data.showNotification('error')
		if getCookie('chronorder') == 'true'
			toggleChronorder()
		highlights = JSON.parse(getCookie("highlights")) || []
		menuicons = !(getCookie('menuicons') == 'false')
		compare_translations.push(settings:translation)
		compare_translations.push(settingsp:translation)
		if JSON.parse(getCookie("compare_translations")) then compare_translations = (JSON.parse(getCookie("compare_translations")):length ? JSON.parse(getCookie("compare_translations")) : no) || compare_translations
		@search = {
				search_div: no,
				search_input: '',
				search_result_header: '',
				search_result_translation: '',
				show_filters: no,
				is_filter: no,
				counter: 50,
				filter: 0,
				loading: no,
				change_translation: no,
				bookid_of_results: [],
				translation: settings:translation
			}
		if JSON.parse(getCookie("bookmarks-to-delete"))
			deleteBookmarks(JSON.parse(getCookie("bookmarks-to-delete")))
			window:localStorage.removeItem("bookmarks-to-delete")

	def mount
		let search = document.getElementById('search_body')
		if search
			search:onscroll = do
				if this:scrollTop > this:scrollHeight - this:clientHeight - 512
					self:_search:counter += 20
					Imba.commit

	def getCookie c_name
		window:localStorage.getItem(c_name)

	def setCookie c_name, value
		window:localStorage.setItem(c_name, value)

	def switchTranslation translation, parallel
		if parallel
			if settingsp:translation != translation || !@parallel_books:length
				@parallel_books = BOOKS[translation]
		else
			if settings:translation != translation || !@books:length
				@books = BOOKS[translation]

	def saveToHistory translation, book, chapter, verse, parallel
		if getCookie("history")
			@history = JSON.parse(getCookie("history"))
		if @history.find(do |element| return element:chapter == chapter && element:book == book && element:translation == translation)
			@history.splice(@history.indexOf(@history.find(do |element| return element:chapter == chapter && element:book == book && element:translation == translation)), 1)
		@history.push({"translation": translation, "book": book, "chapter": chapter, "verse": verse, "parallel": parallel})
		window:localStorage.setItem("history", JSON.stringify(@history))

		if @data.user && window:navigator:onLine
			window.fetch("/save-history/", {
				method: "POST",
				cache: "no-cache",
				headers: {
					'X-CSRFToken': get_cookie('csrftoken'),
					"Content-Type": "application/json"
				},
				body: JSON.stringify({
						history: JSON.stringify(@history),
					})
			})
			.then(do |response| response.json())
			.then(do |data| undefined)
			.catch(do |e|
				console.log(e)
				@data.showNotification('error'))

	def loadData url
		let res = await window.fetch(url)
		return res.json

	def getBookmarks url
		@bookmarks = []
		try
			@bookmarks = await loadData(url)
		catch error
			if @data.can_work_with_db
				@bookmarks = await @data.getBookmarksFromStorage(@verses.map(do |verse| return verse:pk))
		Imba.commit

	def getText translation, book, chapter, verse
		if !(translation == settings:translation && book == settings:book && chapter == settings:chapter) || !@verses:length
			loading = yes
			switchTranslation translation
			if !onpopstate && (@verses:length || !window:navigator:onLine)
				window:history.pushState({
						translation: translation,
						book: book,
						chapter: chapter,
						verse: verse,
						parallel: no,
						parallel_display: settingsp:display
						parallel-translation: settingsp:translation,
						parallel-book: settingsp:book,
						parallel-chapter: settingsp:chapter,
						parallel-verse: 0,
					},
					nameOfBook(settings:book, settings:translation) + ' ' + settings:chapter,
					window:location:origin + '/' + translation + '/' + book + '/' + chapter + '/'
				)
			onpopstate = no
			clearSpace
			document:title = "Bolls Bible " + " " + nameOfBook(book, translation) + ' ' + chapter + ' ' + translations.find(do |element| return element:short_name == translation):full_name
			if @chronorder
				@chronorder = !@chronorder
				toggleChronorder
			settings:book = book
			settings:chapter = chapter
			settings:translation = translation
			setCookie('book', book)
			setCookie('chapter', chapter)
			setCookie('translation', translation)
			saveToHistory(translation, book, chapter, verse, no)
			let url = "/get-text/" + translation + '/' + book + '/' + chapter + '/'
			try
				@verses = []
				if @data.can_work_with_db && @data.downloaded_translations.indexOf(translation) != -1
					@verses = await @data.getChapterFromDB(translation, book, chapter, verse)
				else
					@verses = await loadData(url)
				loading = no
				if verse > 0 then show_verse_picker = no else show_verse_picker = yes
				Imba.commit
			catch error
				loading = no
				console.error('Error: ', error)
				@data.showNotification('error')
			if @data.user then getBookmarks("/get-bookmarks/" + translation + '/' + book + '/' + chapter + '/')
			if verse
				foundVerse(verse, "#{verse}")
			else setTimeout(&, 100) do window.scroll(0,0)
		else clearSpace

	def foundVerse id, hash
		setTimeout(&,250) do
			let searched_verse = document.getElementById(id)
			if searched_verse
				window:location:hash = hash
			else foundVerse id

	def getParallelText translation, book, chapter, verse
		if !(translation == settingsp:translation && book == settingsp:book && chapter == settingsp:chapter) || !@parallel_verses:length || !settingsp:display
			if !onpopstate && @verses
				window:history.pushState({
						translation: settings:translation,
						book: settings:book,
						chapter: settings:chapter,
						verse: settings:verse,
						parallel: yes,
						parallel_display: settingsp:display
						parallel-translation: translation,
						parallel-book: book,
						parallel-chapter: chapter,
						parallel-verse: verse,
					},
					nameOfBook(settings:book, settings:translation) + ' ' + settings:chapter,
					null
				)
			onpopstate = no
			if @chronorder
				@chronorder = !@chronorder
				toggleChronorder
			switchTranslation translation, yes
			settingsp:translation = translation
			settingsp:edited_version = translation
			settingsp:book = book
			settingsp:chapter = chapter
			clearSpace
			let url = "/get-text/" + translation + '/' + book + '/' + chapter + '/'
			@parallel_verses = []
			try
				if @data.can_work_with_db && @data.downloaded_translations.indexOf(translation) != -1
					@parallel_verses = await @data.getChapterFromDB(translation, book, chapter, verse)
				else
					@parallel_verses = await loadData(url)
				if !onpopstate && @verses && !verse && settingsp:display
					show_parallel_verse_picker = true
				Imba.commit
			catch error
				console.error('Error: ', error)
				@data.showNotification('error')
			if @data.user
				url = "/get-bookmarks/" + translation + '/' + book + '/' + chapter + '/'
				@parallel_bookmarks = []
				try
					@parallel_bookmarks = await loadData(url)
					Imba.commit
				catch error
					if @data.can_work_with_db
						let verseids = []
						for verse in @parallel_verses
							verseids.push(verse:pk)
						@parallel_bookmarks = await @data.getBookmarksFromStorage(verseids)
			Imba.commit
			setCookie('parallel_display', settingsp:display)
			saveToHistory translation, book, chapter, 0, yes
			setCookie('parallel_translation', translation)
			setCookie('parallel_book', book)
			setCookie('parallel_chapter', chapter)
			if verse
				foundVerse verse, "#p{verse}"

	def clearSpace
		bible_menu_left = -300
		settings_menu_left = -300
		search:search_div = no
		show_history = no
		dropFilter
		choosen = []
		choosenid = []
		addcollection = no
		show_color_picker = no
		show_collections = no
		choosen_parallel = no
		show_help = no
		show_support = no
		show_compare = no
		show_downloads = no
		was_deleting_translation_from_compare = no
		show_translations_for_comparison = no
		show_parallel_verse_picker = no
		show_verse_picker = no
		show_share_box = no
		choosen_categories = []
		if document.getElementsByTagName('main')[0]
			document.getElementsByTagName('main')[0].focus()
		Imba.commit()

	def turnHelpBox
		if show_help
			clearSpace
		else
			clearSpace
			show_help = !show_help
			what_to_show = 'show_help'

	def turnSupport
		if show_support
			clearSpace
		else
			clearSpace
			show_support = !show_support
			what_to_show = 'show_support'

	def toggleParallelMode parallel
		if !parallel
			settingsp:display = no
			clearSpace
		else
			if getCookie('parallel_translation')
				settingsp:translation = getCookie('parallel_translation')
			if getCookie('parallel_book')
				settingsp:book = parseInt(getCookie('parallel_book'))
			if getCookie('parallel_chapter')
				settingsp:chapter = parseInt(getCookie('parallel_chapter'))
			getParallelText(settingsp:translation, settingsp:book, settingsp:chapter)
			settingsp:display = yes
		setCookie('parallel_display', settingsp:display)

	def changeEditedParallel translation
		settingsp:edited_version = translation
		if @search:change_translation
			getSearchText
			@search:change_translation = no
		@show_list_of_translations = no

	def changeTranslation translation
		if settingsp:edited_version == settingsp:translation && settingsp:display
			switchTranslation translation, yes
			if @parallel_books.find(do |element| return element:bookid == settingsp:book)
				getParallelText(translation, settingsp:book, settingsp:chapter)
			else
				getParallelText(translation, @parallel_books[0]:bookid, 1)
				settingsp:book = @parallel_books[0]:bookid
				settingsp:chapter = 1
			settingsp:translation = translation
			setCookie('translation', translation)
		else
			switchTranslation translation, no
			if @books.find(do |element| return element:bookid == settings:book)
				getText(translation, settings:book, settings:chapter)
			else
				getText(translation, books[0]:bookid, 1)
				settings:book = books[0]:bookid
				settings:chapter = 1
			settings:translation = translation
			setCookie('translation', translation)
		if @search:change_translation
			getSearchText
			@search:change_translation = no
		@show_list_of_translations = no

	def getSearchText
		let query = search:search_input.replace(/\//g, '')
		query = query.replace(/\\/g, '')
		if query:length > 1 && (search:search_result_header != query || !@search:search_div)
			clearSpace
			loading = yes
			let url
			if settingsp:edited_version == settingsp:translation && settingsp:display
				@search:translation = settingsp:edited_version
				url = '/search/' + settingsp:edited_version + '/' + query + '/'
				search:search_result_translation = settingsp:edited_version
			else
				@search:translation = settings:translation
				url = '/search/' + settings:translation + '/' + query + '/'
				search:search_result_translation = settings:translation
			@search_verses = Object.create(null)
			try
				@search_verses = await loadData(url)
				@search:bookid_of_results = []
				for verse in @search_verses
					if !@search:bookid_of_results.find(do |element| return element == verse:book)
						@search:bookid_of_results.push verse:book
				closeSearch()
				what_to_show = ''
				Imba.commit
			catch error
				if @data.can_work_with_db && @data.downloaded_translations.indexOf(search:search_result_translation) != -1
					@search_verses = await @data.getSearchedTextFromStorage(search)
					@search:bookid_of_results = []
					for verse in @search_verses
						if !@search:bookid_of_results.find(do |element| return element == verse:book)
							@search:bookid_of_results.push verse:book
					what_to_show = ''
					closeSearch()
					Imba.commit

	def closeSearch close
		loading = no
		@search:counter = 50
		@search:search_div = yes
		if close
			@search:search_div = !@search:search_div
			@search:change_translation = no
		@search:search_result_header = @search:search_input
		settings_menu_left = -300
		if document.getElementById('search')
			document.getElementById('search').blur()

	def addFilter book
		search:is_filter = yes
		search:filter = book
		search:show_filters = no
		search:counter = 50

	def dropFilter
		search:is_filter = no
		search:show_filters = no
		search:counter = 50

	def getFilteredArray
		return @search_verses.filter(do |verse| verse:book == search:filter)

	def changeTheme theme
		let html = document.querySelector('#html')
		settings:theme = theme
		html:dataset:theme = settings:accent + settings:theme
		html:dataset:light = settings:theme
		setCookie('theme', theme)

	def changeAccent accent
		let html = document.querySelector('#html')
		settings:accent = accent
		html:dataset:theme = settings:accent + settings:theme
		setCookie('accent', accent)
		show_accents = no

	def getRandomColor
		var letters = '0123456789ABCDEF'
		var color = '#'
		for i in [0..5]
			color += letters[Math.floor(Math.random() * 16)]
		return color

	def decreaseFontSize
		if settings:font:size > 16
			settings:font:size -= 2
			setCookie('font', settings:font:size)

	def increaseFontSize
		if settings:font:size < 64 && window:innerWidth > 480
			settings:font:size = settings:font:size + 2
			setCookie('font', settings:font:size)
		elif settings:font:size < 40
			settings:font:size = settings:font:size + 2
			setCookie('font', settings:font:size)

	def setFontFamily font
		settings:font:family = font:code
		settings:font:name = font:name
		setCookie('font-family', font:code)
		setCookie('font-name', font:name)

	def showChapters bookid
		if bookid != @show_chapters_of
			@show_chapters_of = bookid
		else @show_chapters_of = 0

	def showLanguageTranslations language
		if language != show_language_of
			show_language_of = language
		else show_language_of = ''

	def nameOfBook bookid, translation
		for book in BOOKS[translation]
			if book:bookid == bookid
				return book:name

	def chaptersOfCurrentBook parallel
		if parallel
			for book in @parallel_books
				if book:bookid == settingsp:book
					return book:chapters
		else
			for book in books
				if book:bookid == settings:book
					return book:chapters

	def nextChapter parallel
		if parallel == 'true'
			if settingsp:chapter + 1 <= chaptersOfCurrentBook parallel
				getParallelText(settingsp:translation, settingsp:book, settingsp:chapter + 1)
			else
				let current_index = @parallel_books.indexOf(@parallel_books.find(do |element| return element:bookid == settingsp:book))
				if @parallel_books[current_index + 1]
					getParallelText(settingsp:translation, @parallel_books[current_index+1]:bookid, 1)
		else
			if settings:chapter + 1 <= chaptersOfCurrentBook parallel
				getText(settings:translation, settings:book, settings:chapter + 1)
			else
				let current_index = books.indexOf(books.find(do |element| return element:bookid == settings:book))
				if books[current_index + 1]
					getText(settings:translation, books[current_index+1]:bookid, 1)

	def prevChapter parallel
		if parallel == 'true'
			if settingsp:chapter - 1 > 0
				getParallelText(settingsp:translation, settingsp:book, settingsp:chapter - 1)
			else
				let current_index = @parallel_books.indexOf(@parallel_books.find(do |element| return element:bookid == settingsp:book))
				if @parallel_books[current_index - 1]
					getParallelText(settingsp:translation, @parallel_books[current_index - 1]:bookid, @parallel_books[current_index - 1]:chapters)
		else
			if settings:chapter - 1 > 0
				getText(settings:translation, settings:book, settings:chapter - 1)
			else
				let current_index = books.indexOf(books.find(do |element| return element:bookid == settings:book))
				if books[current_index - 1]
					getText(settings:translation, books[current_index - 1]:bookid, books[current_index - 1]:chapters)

	def nextBook
		let current_index = books.indexOf(books.find(do |element| return element:bookid == settings:book))
		if books[current_index + 1]
			getText(settings:translation, books[current_index + 1]:bookid, 1)

	def prevBook
		let current_index = books.indexOf(books.find(do |element| return element:bookid == settings:book))
		if books[current_index - 1]
			getText(settings:translation, books[current_index - 1]:bookid, 1)

	def onmousemove e
		if !settings:lock_drawers && window:innerWidth > 680
			if e.x < 32
				bible_menu_left = 0
			elif e.x > window:innerWidth - 32
				settings_menu_left = 0
			elif 300 < e.x < window:innerWidth - 300
				bible_menu_left = -300
				settings_menu_left = -300

	def ontouchstart touch
		if touch.x < 16 || touch.x > window:innerWidth - 16
			inzone = yes
		elif bible_menu_left > -300 || settings_menu_left > -300
			onzone = yes
		self

	def ontouchupdate touch
		if inzone
			if bible_menu_left < 0 && touch.dx > 0
				bible_menu_left = touch.dx - 300
			if settings_menu_left < 0 && touch.dx < 0
				settings_menu_left = - touch.dx - 300
		else
			if bible_menu_left > -300 && touch.dx < 0
				bible_menu_left = touch.dx
			if settings_menu_left > -300 && touch.dx > 0
				settings_menu_left = - touch.dx
		Imba.commit

	def ontouchend touch
		if bible_menu_left > -300
			if inzone
				touch.dx > 64 ? bible_menu_left = 0 : bible_menu_left = -300
			else
				touch.dx < -64 ? bible_menu_left = -300 : bible_menu_left = 0
		elif settings_menu_left > -300
			if inzone
				touch.dx < -64 ? settings_menu_left = 0 : settings_menu_left = -300
			else
				touch.dx > 64 ? settings_menu_left = -300 : settings_menu_left = 0
		elif document.getSelection == '' && Math.abs(touch.dy) < 36 && !search:search_div && !show_history && !choosenid:length
			if touch.dx < -32
				settingsp:display && touch.y > window:innerHeight / 2 ? nextChapter("true") : nextChapter
			elif touch.dx > 32
				settingsp:display && touch.y > window:innerHeight / 2 ? prevChapter("true") : prevChapter
		inzone = no
		onzone = no
		Imba.commit

	def getHighlight verse, bookmarks
		if choosenid:length && choosenid.find(do |element| return element == verse)
			let img = 'linear-gradient(to right'
			for i in [0..96]
				img += ', ' + (i % 2 ? '#0000' : highlight_color) + ' ' + i + '% ' + (i + 8) + '%'
				i+=4
			return img += ')'
		else
			let highlight = self[bookmarks]().find(do |element| return element:verse == verse)
			if highlight
				return  "linear-gradient({highlight:color} 0px, {highlight:color} 100%)"
			else
				return ''

	def getParallelHighlight verse
		if choosenid:length && choosenid.find(do |element| return element == verse)
			return highlight_color
		else
			let highlight = @parallel_bookmarks.find(do |element| return element:verse == verse)
			if highlight
				return highlight:color

	def getNoteOfChoosen verse
		let highlight = @bookmarks.find(do |element| return element:verse == verse)
		highlight ? highlight:note : ''

	def pushNoteIfExist pk
		let note = getNoteOfChoosen(pk)
		if note
			for piece in note.split(' | ')
				if piece != '' && !choosen_categories.find(do |element| return element == piece)
					choosen_categories.push(piece)

	def addToChoosen pk, id, parallel
		if !settings_menu_left || !bible_menu_left
			return clearSpace()
		highlight_color = getRandomColor()
		if document.getSelection == ''
			if !choosen_parallel
				choosen_parallel = parallel
				choosenid.push pk
				choosen.push id
				pushNoteIfExist pk
				if window:innerWidth < 600
					if parallel == "first"
						window:location:hash = "#{id}"
					else
						window:location:hash = "#p{id}"
			elif choosen_parallel == parallel
				if choosenid.find(do |element| return element == pk)
					choosenid.splice(choosenid.indexOf(pk), 1)
					choosen.splice(choosen.indexOf(id), 1)
					let note = getNoteOfChoosen(pk)
					if note
						for piece in note.split(' | ')
							if piece != ''
								choosen_categories.splice(choosen_categories.indexOf(choosen_categories.find(do |element| return element == piece)), 1)
				else
					choosenid.push(pk)
					choosen.push(id)
					pushNoteIfExist(pk)
				if !choosenid:length
					clearSpace()
				show_collections = no
		if choosenid:length
			if choosen_parallel == 'first'
				highlighted_title = getHighlightedRow(settings:translation, settings:book, settings:chapter, choosen)
			else
				highlighted_title = getHighlightedRow(settingsp:translation, settingsp:book, settingsp:chapter, choosen)

	def changeHighlightColor color
		show_color_picker = no
		highlight_color = color

	def getHighlightedRow translation, book, chapter, verses
		let row = nameOfBook(book, translation) + ' ' + chapter + ':'
		for id, key in verses.sort(do |a, b| return a - b)
			if id == verses[key - 1] + 1
				if id == verses[key+1] - 1
					continue
				else row += '-' + id
			else
				if !key
					row += id
				else row += ',' + id
		return row

	def get_cookie name
		let cookieValue = null
		if document:cookie && document:cookie !== ''
			let cookies = document:cookie.split(';')
			for i in cookies
				let cookie = i.trim()
				if (cookie.substring(0, name:length + 1) === (name + '='))
					cookieValue = window.decodeURIComponent(cookie.substring(name:length + 1))
					break
		return cookieValue

	def sendBookmarksToDjango
		if highlight_color:length > 9
			if highlights.find(do |element| return element == highlight_color)
				highlights.splice(highlights.indexOf(highlights.find(do |element| return element == highlight_color)), 1)
			highlights.push(highlight_color)
			window:localStorage.setItem("highlights", JSON.stringify(highlights))
		let notes = ''
		for category, key in choosen_categories
			notes += category
			if key + 1 < choosen_categories:length
				notes += " | "
		if !@data.user
			window:location:pathname = "/signup/"
			return
		if window:navigator:onLine
			window.fetch("/save-bookmarks/", {
				method: "POST",
				cache: "no-cache",
				headers: {
					'X-CSRFToken': get_cookie('csrftoken'),
					"Content-Type": "application/json"
				},
				body: JSON.stringify({
					verses: JSON.stringify(choosenid),
					color: highlight_color,
					date: Date.now(),
					notes: notes
				}),
			})
			.then(do |response| response.json())
			.then(do |data| @data.showNotification('saved'))
			.catch(do |e|
				console.log(e)
				@data.showNotification('error'))
		elif @data.can_work_with_db
			@data.saveBookmarksToStorageUntillOnline({
				verses: choosenid,
				color: highlight_color,
				date: Date.now(),
				notes: choosen_categories
			})
		if choosen_parallel == 'second'
			for verse in choosenid
				if @parallel_bookmarks.find(do |bookmark| return bookmark:verse == verse)
					@parallel_bookmarks.splice(@parallel_bookmarks.indexOf(@parallel_bookmarks.find(do |bookmark| return bookmark:verse == verse)), 1)
				@parallel_bookmarks.push({
					verse: verse,
					date: Date.now(),
					color: highlight_color,
					note: notes})
		else
			for verse in choosenid
				if @bookmarks.find(do |bookmark| return bookmark:verse == verse)
					@bookmarks.splice(@bookmarks.indexOf(@bookmarks.find(do |bookmark| return bookmark:verse == verse)), 1)
				@bookmarks.push({
					verse: verse,
					date: Date.now(),
					color: highlight_color,
					note: notes})
		clearSpace

	def deleteColor color_to_delete
		highlights.splice(highlights.indexOf(color_to_delete), 1)
		window:localStorage.setItem("highlights", JSON.stringify(highlights))

	def deleteBookmarks pks
		let should_to_delete = no
		let indexes_of_bookmarks = parallel_bookmarks.map(do |x| x:verse)
		indexes_of_bookmarks = indexes_of_bookmarks.concat(bookmarks.map(do |x| x:verse))
		for pk in pks
			if indexes_of_bookmarks.indexOf(pk) != -1
				should_to_delete = yes
				break
		if @data.user && should_to_delete
			@data.requestDeleteBookmark(pks)
			if choosen_parallel == 'second'
				for verse in choosenid
					if @parallel_bookmarks.find(do |bookmark| return bookmark:verse == verse)
						@parallel_bookmarks.splice(@parallel_bookmarks.indexOf(@parallel_bookmarks.find(do |bookmark| return bookmark:verse == verse)), 1)
			else
				for verse in choosenid
					if @bookmarks.find(do |bookmark| return bookmark:verse == verse)
						@bookmarks.splice(@bookmarks.indexOf(@bookmarks.find(do |bookmark| return bookmark:verse == verse)), 1)
		clearSpace

	def getShareObj
		let copyobj = {
			text: [],
			verse: [],
			translation: '',
			book: 0,
			chapter: 0
		}
		if choosen_parallel == 'first'
			copyobj:title = getHighlightedRow(settings:translation, settings:book, settings:chapter, choosen)
		else
			copyobj:title = getHighlightedRow(settingsp:translation, settingsp:book, settingsp:chapter, choosen)
		if choosen_parallel == 'second'
			for verse in parallel_verses
				if choosenid.find(do |element| return element == verse:pk)
					copyobj:text.push(verse:text)
					copyobj:verse.push(verse:verse)
			copyobj:translation = settingsp:translation
			copyobj:book = settingsp:book
			copyobj:chapter = settingsp:chapter
		else
			for verse in verses
				if choosenid.find(do |element| return element == verse:pk)
					copyobj:text.push(verse:text)
					copyobj:verse.push(verse:verse)
			copyobj:translation = settings:translation
			copyobj:book = settings:book
			copyobj:chapter = settings:chapter
		return copyobj

	def copyToClipboard
		@data.copyToClipboard(getShareObj())
		clearSpace

	def byteCount s
		window.encodeURI(s).split(/%..|./):length - 1

	def canShareViaTelegram
		const copyobj = getShareObj()
		return byteCount("https://t.me/share/url?url={window.encodeURIComponent("https://bolls.life" + '/'+ copyobj:translation + '/' + copyobj:book + '/' + copyobj:chapter + '/' + copyobj:verse.sort(do |a, b| return a - b)[0] + '/')}&text={window.encodeURIComponent('«' + copyobj:text.join(' ').trim().replace(/<[^>]*>/gi, '') + '»\n\n' + copyobj:title + ' ' + copyobj:translation)}") < 4096

	def shareTelegram
		const copyobj = getShareObj()
		const text = '«' + copyobj:text.join(' ').trim().replace(/<[^>]*>/gi, '') + '»\n\n' + copyobj:title + ' ' + copyobj:translation
		const url = "https://bolls.life" + '/'+ copyobj:translation + '/' + copyobj:book + '/' + copyobj:chapter + '/' + copyobj:verse.sort(do |a, b| return a - b)[0] + '/'
		const link = "https://t.me/share/url?url={window.encodeURIComponent(url)}&text={window.encodeURIComponent(text)}"
		if byteCount(link) < 4096
			window.open(link, '_blank')
		clearSpace()

	def sharedText
		const copyobj = getShareObj()
		const text = '«' + copyobj:text.join(' ').trim().replace(/<[^>]*>/gi, '') + '»\n\n' + copyobj:title + ' ' + copyobj:translation + "https://bolls.life" + '/'+ copyobj:translation + '/' + copyobj:book + '/' + copyobj:chapter + '/' + copyobj:verse.sort(do |a, b| return a - b)[0] + '/'

	def canMakeTweet
		return sharedText():length < 281

	def makeTweet
		window.open("https://twitter.com/intent/tweet?text={window.encodeURIComponent(sharedText())}", '_blank')
		clearSpace()

	def shareViaFB
		const copyobj = getShareObj()
		window.open("https://www.facebook.com/sharer.php?u=https://bolls.life/" + copyobj:translation + '/' + copyobj:book + '/' + copyobj:chapter + '/' + copyobj:verse.sort(do |a, b| return a - b)[0] + '/', '_blank')
		clearSpace()

	def shareViaWhatsApp
		window.open("https://api.whatsapp.com/send?text={window.encodeURIComponent(sharedText())}", '_blank')
		clearSpace()

	def shareViaVK
		const copyobj = getShareObj()
		const text = '«' + copyobj:text.join(' ').trim().replace(/<[^>]*>/gi, '') + '»\n\n' + copyobj:title + ' ' + copyobj:translation
		const url = "https://bolls.life" + '/'+ copyobj:translation + '/' + copyobj:book + '/' + copyobj:chapter + '/' + copyobj:verse.sort(do |a, b| return a - b)[0] + '/'
		window.open("http://vk.com/share.php?url={window.encodeURIComponent(url)}&title={window.encodeURIComponent(text)}", '_blank')
		clearSpace()

	def shareViaViber
		window.open("viber://forward?text={window.encodeURIComponent(sharedText())}", '_blank')
		clearSpace()

	def toProfile from_build = no
		clearSpace
		flag("display_none")
		if !from_build
			window:history.pushState({
					parallel: no,
					profile: yes
				},
				"profile",
				"/profile/"
			)
		document:title = "Bolls " + " | " + @data.user
		Imba.mount <Profile[@data]>

	def toDownloads from_build
		clearSpace
		flag("display_none")
		if !from_build
			window:history.pushState({
					parallel: no,
					downloads: yes
				},
				"downloads",
				"/downloads/"
			)
		document:title = "Bolls " + @data.lang:download
		Imba.mount <Downloads[@data]>

	def getNameOfBookFromHistory translation, bookid
		let books = []
		books = BOOKS[translation]
		for book in books
			if book:bookid == bookid
				return book:name

	def turnHistory
		show_history = !show_history
		settings_menu_left = -300

	def clearHistory
		turnHistory
		@history = []
		window:localStorage.setItem("history", "[]")
		if @data.user
			window.fetch("/save-history/", {
				method: "POST",
				cache: "no-cache",
				headers: {
					'X-CSRFToken': get_cookie('csrftoken'),
					"Content-Type": "application/json"
				},
				body: JSON.stringify({
						history: "[]",
					})
			})
			.then(do |response| response.json())
			.then(do |data| undefined)
			.catch(do |error|
				console.log(error)
				@data.showNotification('error'))

	def turnCollections
		if addcollection
			addcollection = no
		else
			show_collections = !show_collections
			show_color_picker = no
			if show_collections && @data.user
				let url = "/get-categories/"
				if window:navigator:onLine
					let data = await loadData(url)
					@categories = []
					for categories in data:data
						for piece in categories:note.split(' | ')
							if piece != ''
								@categories.push(piece)
					for category in choosen_categories
						if !@categories.find(do |element| return element == category)
							@categories.unshift category
					@categories = Array.from(Set.new(@categories))
					window:localStorage.setItem('categories', JSON.stringify(@categories))
					Imba.commit
				else
					@categories = JSON.parse(window:localStorage.getItem('categories'))

	def addCollection
		addcollection = yes
		setTimeout(&,400) do
			document.getElementById('newcollectioninput').focus

	def addNewCollection collection
		if choosen_categories.find(do |element| return element == collection)
			choosen_categories.splice(choosen_categories.indexOf(choosen_categories.find(do |element| return element == collection)), 1)
		elif collection
			choosen_categories.push collection
			if !@categories.find(do |element| return element == collection)
				@categories.unshift(collection)
				sendBookmarksToDjango
				clearSpace
			if collection == store:newcollection
				document.getElementById('newcollectioninput'):value = ''
				store:newcollection = ""
		else
			sendBookmarksToDjango
			clearSpace
		window:localStorage.setItem('categories', JSON.stringify(@categories))

	def currentTranslation translation
		if settingsp:display
			if settingsp:edited_version == settingsp:translation
				return translation == settingsp:translation
			else
				return translation == settings:translation
		else
			return translation == settings:translation

	def toggleBibleMenu parallel
		if bible_menu_left
			bible_menu_left = 0
			settings_menu_left = -300
			if parallel
				settingsp:edited_version = settingsp:translation
			else
				settingsp:edited_version = settings:translation
		else
			bible_menu_left = -300

	def toggleSettingsMenu
		if settings_menu_left
			settings_menu_left = 0
			bible_menu_left = -300
		else
			settings_menu_left = -300

	def toggleChronorder
		if @chronorder
			@parallel_books.sort(do |book, koob| return book:bookid - koob:bookid)
			@books.sort(do |book, koob| return book:bookid - koob:bookid)
		else
			@parallel_books.sort(do |book, koob| return book:chronorder - koob:chronorder)
			@books.sort(do |book, koob| return book:chronorder - koob:chronorder)
		@chronorder = !@chronorder
		setCookie('chronorder', @chronorder.toString)

	def showTranslations
		@show_list_of_translations = yes
		@search:change_translation = yes
		toggleBibleMenu

	def backInHistory h, parallel
		if parallel != undefined
			getParallelText(h:translation, h:book, h:chapter, h:verse)
			settingsp:display = yes
			setCookie('parallel_display', settingsp:display)
		else
			getText(h:translation, h:book, h:chapter, h:verse)

	def toggleTransitions
		settings:transitions = !settings:transitions
		setCookie('transitions', settings:transitions)
		let html = document.querySelector('#html')
		html:dataset:transitions = settings:transitions

	def toggleVersePicker
		settings:verse_picker = !settings:verse_picker
		setCookie('verse_picker', settings:verse_picker)

	def toggleVerseBreak
		settings:verse_break = !settings:verse_break
		setCookie('verse_break', settings:verse_break)

	def toggleLockDrawers
		settings:lock_drawers = !settings:lock_drawers
		setCookie('lock_drawers', settings:lock_drawers)

	def translationFullName tr
		translations.find(do |translation| return translation:short_name == tr):full_name

	def toggleCompare
		let book, chapter
		if choosen:length then choosen_for_comparison = choosen
		if choosen_parallel == 'second'
			compare_parallel_of_chapter = settingsp:chapter
			compare_parallel_of_book = settingsp:book
		else
			compare_parallel_of_chapter = settings:chapter
			compare_parallel_of_book = settings:book
		if show_compare
			clearSpace()
			show_compare = yes
			what_to_show = 'show_compare'
		else clearSpace()
		was_deleting_translation_from_compare = no
		loading = yes
		if !window:navigator:onLine && @data.can_work_with_db && @data.downloaded_translations.indexOf(settings:translation) != -1
			comparison_parallel = await @data.getParallelVersesFromStorage(compare_translations, choosen_for_comparison, compare_parallel_of_book, compare_parallel_of_chapter)
			loading = no
			show_compare = yes
			what_to_show = 'show_compare'
			Imba.commit()
		else
			comparison_parallel = []
			window.fetch("/get-paralel-verses/", {
				method: "POST",
				cache: "no-cache",
				headers: {
					"Content-Type": "application/json"
				},
				body: JSON.stringify({
					translations: JSON.stringify(compare_translations),
					verses: JSON.stringify(choosen_for_comparison),
					book: compare_parallel_of_book,
					chapter: compare_parallel_of_chapter,
				}),
			})
			.then(do |response| response.json())
			.then(do |data|
					comparison_parallel = data
					loading = no
					show_compare = yes
					what_to_show = 'show_compare'
					Imba.commit()
				)
			.catch(do |error|
				log error
				loading = no
				@data.showNotification('error'))

	def addTranslation translation
		if !compare_translations.find(do |element| return element == translation:short_name)
			compare_translations.unshift(translation:short_name)
			if was_deleting_translation_from_compare
				toggleCompare()
			else
				window.fetch("/get-paralel-verses/", {
					method: "POST",
					cache: "no-cache",
					headers: {
						"Content-Type": "application/json"
					},
					body: JSON.stringify({
						translations: JSON.stringify([translation:short_name]),
						verses: JSON.stringify(choosen_for_comparison),
						book: compare_parallel_of_book,
						chapter: compare_parallel_of_chapter,
					}),
				})
				.then(do |response| response.json())
				.then(do |data|
						comparison_parallel = data.concat(comparison_parallel)
						loading = no
						Imba.commit()
					)
				.catch(do |error|
					log error
					loading = no
					@data.showNotification('error'))
		else
			compare_translations.splice(compare_translations.indexOf(compare_translations.find(do |element| return element == translation:short_name)), 1)
			document.getElementById("compare_{translation:short_name}"):style:animation = "the-element-left-us 300ms ease forwards"
			setTimeout(&, 300) do
				document.getElementById("compare_{translation:short_name}"):style:animation = ""
				document.getElementById("compare_{translation:short_name}").remove()
				was_deleting_translation_from_compare = yes
		window:localStorage.setItem("compare_translations", JSON.stringify(compare_translations))
		show_translations_for_comparison = no

	def changeLineHeight increase
		if increase && settings:font:line-height < 2.6
			settings:font:line-height += 0.2
		elif settings:font:line-height > 1.2
			settings:font:line-height -= 0.2
		setCookie('line-height', settings:font:line-height)

	def changeMaxWidth increase
		if increase && settings:font:max-width < 120 && (settings:font:max-width - 15) * settings:font:size < window:innerWidth
			settings:font:max-width += 15
		elif settings:font:max-width > 15
			settings:font:max-width -= 15
		setCookie('max-width', settings:font:max-width)

	def ongettext event
		let e = event:_data
		getText(e:translation, e:book, e:chapter, e:verse)

	def toggleDownloads
		clearSpace
		show_downloads = !show_downloads
		show_downloads ? what_to_show = 'show_downloads' : undefined

	def changeFontWeight value
		if settings:font:weight + value < 1000 && settings:font:weight + value > 0
			settings:font:weight += value
			setCookie('font-weight', settings:font:weight)

	def boxShadow grade
		settings:theme == 'light' ? "box-shadow: 0 0 {(grade + 300) / 5}px #0001;" : ''

	def featherSearch feather, haystack
		feather = feather.toLowerCase()
		haystack = haystack.toLowerCase()
		let haystackLength = haystack:length
		let featherLength = feather:length

		if featherLength > haystackLength
			return no

		if featherLength is haystackLength
			return feather is haystack

		let featherLetter = 0
		while featherLetter < featherLength
			let haystackLetter = 0
			let match = no
			var featherLetterCode = feather.charCodeAt(featherLetter++)

			while haystackLetter < haystackLength
				if haystack.charCodeAt(haystackLetter++) is featherLetterCode
					break match = yes

			continue if match
			return no
		return yes

	def filteredBooks books
		let filtered = []
		for book in self[books]()
			if featherSearch(store:book_search, book:name)
				filtered.push(book)
		return filtered

	def copyToClipboardFromParallel tr
		let copyobj = {
			text: [],
			translation: tr[0]:translation,
			book: tr[0]:book,
			chapter: tr[0]:chapter,
			verse: [],
		}
		for t in tr
			copyobj:text.push(t:text)
			copyobj:verse.push(t:verse)
		copyobj:title = getHighlightedRow(copyobj:translation, copyobj:book, copyobj:chapter, copyobj:verse)
		@data.copyToClipboard(copyobj)

	def copyToClipboardFromSerach obj
		@data.copyToClipboard({
			text: [obj:text],
			translation: obj:translation,
			book: obj:book,
			chapter: obj:chapter,
			verse: [obj:verse],
			title: getHighlightedRow(obj:translation, obj:book, obj:chapter, [obj:verse])
		})

	def onsavechangestocomparetranslations arr
		if compare_translations.join('') == arr:_data.join('')
			was_deleting_translation_from_compare = yes
		log arr:_data
		compare_translations = arr:_data
		window:localStorage.setItem("compare_translations", JSON.stringify(arr:_data))

	def currentLanguage
		switch @data.language
			when 'ukr' then "Українська"
			when 'ru' then "Русский"
			when 'pt' then "Portuguese"
			when 'es' then "Español"
			else "English"

	def hideVersePicker
		show_parallel_verse_picker = no
		show_verse_picker = no

	def render
		<self>
			<nav style="left: {bible_menu_left}px; {boxShadow(bible_menu_left)} {bible_menu_left > - 300 && (inzone || onzone) ? 'transition: none;will-change: left;' : ''}">
				if settingsp:display
					<.choose_parallel>
						<p.translation_name title=translationFullName(settings:translation) a:role="button" .current_translation=(settingsp:edited_version == settings:translation) :click.prevent.changeEditedParallel(settings:translation) tabindex="0"> settings:translation
						<p.translation_name title=translationFullName(settingsp:translation) a:role="button" .current_translation=(settingsp:edited_version == settingsp:translation) :click.prevent.changeEditedParallel(settingsp:translation) tabindex="0"> settingsp:translation
					if settingsp:edited_version == settingsp:translation
						<p.translation_name title=@data.lang:change_translation :click.prevent=(do @show_list_of_translations = !@show_list_of_translations) tabindex="0"> settingsp:edited_version
					else
						<p.translation_name title=@data.lang:change_translation :click.prevent=(do @show_list_of_translations = !@show_list_of_translations) tabindex="0"> settings:translation
				else
					<p.translation_name title=@data.lang:change_translation :click.prevent=(do @show_list_of_translations = !@show_list_of_translations) tabindex="0"> settings:translation
				<svg:svg.chronological_order .hide_chron_order=@show_list_of_translations .chronological_order_in_use=@chronorder :click.prevent.toggleChronorder xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" title=@data.lang:chronological_order>
					<svg:title> @data.lang:chronological_order
					<svg:path d="M10 20a10 10 0 1 1 0-20 10 10 0 0 1 0 20zm0-2a8 8 0 1 0 0-16 8 8 0 0 0 0 16zm-1-7.59V4h2v5.59l3.95 3.95-1.41 1.41L9 10.41z">
				if @data.can_work_with_db
					<svg:svg.download_translations .hide_chron_order=@show_list_of_translations :click.prevent.toggleDownloads() xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24">
						<svg:title> @data.lang:download
						<svg:path d="M0 0h24v24H0z" fill="none">
						<svg:path d=svg_paths:download>
				<.translations_list .show_translations_list=@show_list_of_translations>
					for language in languages
						<a.book_in_list dir="auto" .pressed=(language:language == show_language_of) .active=(language:translations.find(do |translation| currentTranslation(translation:short_name))) :click.prevent.showLanguageTranslations(language:language) tabindex="0">
							language:language
							<svg:svg.arrow_next xmlns="http://www.w3.org/2000/svg" width="8" height="5" viewBox="0 0 8 5">
								<svg:title> @data.lang:open
								<svg:polygon points="4,3 1,0 0,1 4,5 8,1 7,0">
						<ul.list_of_chapters dir="auto" .show_list_of_chapters=(language:language == show_language_of)>
							for translation in language:translations
								<li.book_in_list .active=currentTranslation(translation:short_name) tabindex="0" style="display: flex;">
									<span :click.prevent.changeTranslation(translation:short_name)> translation:full_name
									if translation:info then <a href=translation:info title=translation:info target="_blank" rel="noreferrer">
										<svg:svg.translation_info xmlns="http://www.w3.org/2000/svg" height="24" viewBox="0 0 24 24" width="24">
											<svg:title> translation:info
											<svg:path d="M11 7h2v2h-2zm0 4h2v6h-2zm1-9C6.48 2 2 6.48 2 12s4.48 10 10 10 10-4.48 10-10S17.52 2 12 2zm0 18c-4.41 0-8-3.59-8-8s3.59-8 8-8 8 3.59 8 8-3.59 8-8 8z">
					<.freespace>
				<.books-container dir="auto" .lower=(settingsp:display)>
					if settingsp:edited_version == settingsp:translation && settingsp:display
						for book in filteredBooks('parallel_books')
							<a.book_in_list dir="auto" .active=(book:bookid==settingsp:book) :click.prevent.showChapters(book:bookid) tabindex="0"> book:name
							<ul.list_of_chapters dir="auto" .show_list_of_chapters=(book:bookid==show_chapters_of)>
								for i in [0..book:chapters]
									<li.chapter_number .active=((i + 1) == settingsp:chapter &&book:bookid==settingsp:book ) :click.prevent.getParallelText(settingsp:translation, book:bookid, i+1) tabindex="0"> i+1
						if !filteredBooks('parallel_books'):length
							<p.book_in_list style="white-space: pre;"> "(ಠ╭╮ಠ)    ¯\\_(ツ)_/¯   ノ( ゜-゜ノ)"
					else
						for book in filteredBooks('books')
							<a.book_in_list dir="auto" .active=(book:bookid==settings:book) :click.prevent.showChapters(book:bookid) tabindex="0"> book:name
							<ul.list_of_chapters dir="auto" .show_list_of_chapters=(book:bookid==show_chapters_of)>
								for i in [0..book:chapters]
									<li.chapter_number .active=((i + 1) == settings:chapter && book:bookid==settings:book) :click.prevent.getText(settings:translation, book:bookid, i+1)  tabindex="0"> i+1
						if !filteredBooks('books'):length
							<p.book_in_list style="white-space: pre;"> "(ಠ╭╮ಠ)    ¯\\_(ツ)_/¯   ノ( ゜-゜ノ)"
					<.freespace>
				<input[store:book_search].search type="text" placeholder=@data.lang:search input:aria-label=@data.lang:search> @data.lang:search
				<svg:svg.close_book_search :click.prevent=(do store:book_search = '') xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" tabindex="0">
					<svg:title> @data.lang:delete
					<svg:path d=svg_paths:close css:margin="auto">

			<main.main tabindex="0" .parallel_text=settingsp:display style="font-family: {settings:font:family}; font-size: {settings:font:size}px; line-height: {settings:font:line-height}; font-weight: {settings:font:weight};">
				<section .parallel=settingsp:display dir="auto" style="margin: auto; max-width: {settings:font:max-width}em;">
					if @verses:length
						<h1 style="font-family: {settings:font:family}; font-weight: {settings:font:weight + 200};" :click.prevent.toggleBibleMenu() title=translationFullName(settings:translation)> nameOfBook(settings:book, settings:translation), ' ', settings:chapter
						<article>
							for verse in @verses
								if settings:verse_break
									<br>
								<a.verse id=verse:verse href="#{verse:verse}"> '\t', verse:verse
								<text-as-html[verse]
										:click.prevent.addToChoosen(verse:pk, verse:verse, 'first')
										style="background-image:{getHighlight(verse:pk, 'bookmarks')}"
									>
							<.arrows>
								<a.arrow :click.prevent.prevChapter() title=@data.lang:prev>
									<svg:svg.arrow_prev xmlns="http://www.w3.org/2000/svg" width="8" height="5" viewBox="0 0 8 5">
										<svg:title> @data.lang:prev
										<svg:polygon points="4,3 1,0 0,1 4,5 8,1 7,0">
								<a.arrow :click.prevent.nextChapter() title=@data.lang:next>
									<svg:svg.arrow_next xmlns="http://www.w3.org/2000/svg" width="8" height="5" viewBox="0 0 8 5">
										<svg:title> @data.lang:next
										<svg:polygon points="4,3 1,0 0,1 4,5 8,1 7,0">
							if choosen:length
								<.freespace>
					if !window:navigator:onLine && @data.downloaded_translations.indexOf(settings:translation) == -1 && !(@verses:length)
						<p.in_offline>
							@data.lang:this_translation_is_unavailable
							<br>
							<a.reload :tap=(do window:location.reload(yes))> @data.lang:reload
				<section.display_none.parallel .show_parallel=settingsp:display dir="auto" style="margin: auto;max-width: {settings:font:max-width}em;">
					if @parallel_verses:length
						<h1 style="font-family: {settings:font:family}; font-weight: {settings:font:weight + 200};" :click.prevent.toggleBibleMenu(yes) title=translationFullName(settingsp:translation)> nameOfBook(settingsp:book, settingsp:translation), ' ', settingsp:chapter
						<article>
							for verse in @parallel_verses
								if settings:verse_break
									<br>
								<a.verse id="p{verse:verse}" href="#p{verse:verse}"> '\t', verse:verse
								<text-as-html[verse]
									:click.prevent.addToChoosen(verse:pk, verse:verse, 'second')
									style="background-image:{getHighlight(verse:pk, 'parallel_bookmarks')}">
							<.arrows>
								<a.arrow :click.prevent.prevChapter("true")>
									<svg:svg.arrow_prev xmlns="http://www.w3.org/2000/svg" width="8" height="5" viewBox="0 0 8 5">
										<svg:title> @data.lang:prev
										<svg:polygon points="4,3 1,0 0,1 4,5 8,1 7,0">
								<a.arrow :click.prevent.nextChapter("true")>
									<svg:svg.arrow_next xmlns="http://www.w3.org/2000/svg" width="8" height="5" viewBox="0 0 8 5">
										<svg:title> @data.lang:next
										<svg:polygon points="4,3 1,0 0,1 4,5 8,1 7,0">
							if choosenid:length
								<.freespace>
					if !window:navigator:onLine && @data.downloaded_translations.indexOf(settingsp:translation) == -1 && !(@parallel_verses:length)
						<p.in_offline> @data.lang:this_translation_is_unavailable

			<aside style="right: {settings_menu_left}px; {boxShadow(settings_menu_left)} {settings_menu_left > - 300 && (inzone || onzone) ? 'transition: none;will-change: right;' : ''}">
				<p.settings_header>
					@data.lang:other
					<.current_accent .blur_current_accent=show_accents :click.prevent=(do show_accents = !show_accents)>
					<.accents .show_accents=show_accents>
						for accent in accents when accent:name != settings:accent
							<.accent :click.prevent.changeAccent(accent:name) style="background-color: {settings:theme == 'dark' ? accent:light : accent:dark};">
				<input[search:search_input].search id='search' type='text' placeholder=@data.lang:search input:aria-label=@data.lang:search :keydown.enter.prevent.getSearchText> @data.lang:search
				<.btnbox>
					<svg:svg.cbtn :click.prevent.changeTheme("dark") style="padding: 8px;" xmlns="http://www.w3.org/2000/svg" enable-background="new 0 0 24 24" height="24" viewBox="0 0 24 24" width="24">
						<svg:title> @data.lang:nighttheme
						<svg:g>
							<svg:rect fill="none" height="24" width="24">
						<svg:g>
							<svg:path d="M11.1,12.08C8.77,7.57,10.6,3.6,11.63,2.01C6.27,2.2,1.98,6.59,1.98,12c0,0.14,0.02,0.28,0.02,0.42 C2.62,12.15,3.29,12,4,12c1.66,0,3.18,0.83,4.1,2.15C9.77,14.63,11,16.17,11,18c0,1.52-0.87,2.83-2.12,3.51 c0.98,0.32,2.03,0.5,3.11,0.5c3.5,0,6.58-1.8,8.37-4.52C18,17.72,13.38,16.52,11.1,12.08z">
						<svg:path d="M7,16l-0.18,0C6.4,14.84,5.3,14,4,14c-1.66,0-3,1.34-3,3s1.34,3,3,3c0.62,0,2.49,0,3,0c1.1,0,2-0.9,2-2 C9,16.9,8.1,16,7,16z">
					<svg:svg.cbtn :click.prevent.changeTheme("light") style="padding: 8px;" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20">
						<svg:title> @data.lang:lighttheme
						<svg:path d="M10 14a4 4 0 1 1 0-8 4 4 0 0 1 0 8zM9 1a1 1 0 1 1 2 0v2a1 1 0 1 1-2 0V1zm6.65 1.94a1 1 0 1 1 1.41 1.41l-1.4 1.4a1 1 0 1 1-1.41-1.41l1.4-1.4zM18.99 9a1 1 0 1 1 0 2h-1.98a1 1 0 1 1 0-2h1.98zm-1.93 6.65a1 1 0 1 1-1.41 1.41l-1.4-1.4a1 1 0 1 1 1.41-1.41l1.4 1.4zM11 18.99a1 1 0 1 1-2 0v-1.98a1 1 0 1 1 2 0v1.98zm-6.65-1.93a1 1 0 1 1-1.41-1.41l1.4-1.4a1 1 0 1 1 1.41 1.41l-1.4 1.4zM1.01 11a1 1 0 1 1 0-2h1.98a1 1 0 1 1 0 2H1.01zm1.93-6.65a1 1 0 1 1 1.41-1.41l1.4 1.4a1 1 0 1 1-1.41 1.41l-1.4-1.4z">
				<.btnbox>
					<a.cbtn style="padding: 12px; font-size: 20px;" :click.prevent.decreaseFontSize title=@data.lang:decrease_font_size> "B-"
					<a.cbtn style="padding: 8px; font_size: 24px;" :click.prevent.increaseFontSize title=@data.lang:increase_font_size> "B+"
				<.btnbox>
					<a.cbtn style="padding: 8px; font-size: 24px; font-weight: 100;" :click.prevent.changeFontWeight(-100) title=@data.lang:decrease_font_weight> "B"
					<a.cbtn style="padding: 8px; font-size: 24px; font-weight: 900;" :click.prevent.changeFontWeight(100) title=@data.lang:increase_font_weight> "B"
				<.btnbox>
					<svg:svg.cbtn :click.prevent.changeLineHeight(no) xmlns="http://www.w3.org/2000/svg" width="38" height="14" viewBox="0 0 38 14" fill="context-fill" style="padding: calc(42px - 26px) 0;">
						<svg:title> @data.lang:decrease_line_height
						<svg:rect x="0" y="0" width="28" height="2">
						<svg:rect x="0" y="6" width="38" height="2">
						<svg:rect x="0" y="12" width="18" height="2">
					<svg:svg.cbtn :click.prevent.changeLineHeight(yes) xmlns="http://www.w3.org/2000/svg" width="38" height="24" viewBox="0 0 38 24" fill="context-fill" style="padding: calc(42px - 32px) 0;">
						<svg:title> @data.lang:increase_line_height
						<svg:rect x="0" y="0" width="28" height="2">
						<svg:rect x="0" y="11" width="38" height="2">
						<svg:rect x="0" y="22" width="18" height="2">
				if window:innerWidth > 600
					<.btnbox>
						<svg:svg.cbtn :click.prevent.changeMaxWidth(no) xmlns="http://www.w3.org/2000/svg" width="42" height="16" viewBox="0 0 42 16" fill="context-fill" style="padding: calc(42px - 28px) 0;">
							<svg:title> @data.lang:increase_max_width
							<svg:path d="M14.5,7 L8.75,1.25 L10,-1.91791433e-15 L18,8 L17.375,8.625 L10,16 L8.75,14.75 L14.5,9 L1.13686838e-13,9 L1.13686838e-13,7 L14.5,7 Z">
							<svg:path d="M38.5,7 L32.75,1.25 L34,6.58831647e-15 L42,8 L41.375,8.625 L34,16 L32.75,14.75 L38.5,9 L24,9 L24,7 L38.5,7 Z" transform="translate(33.000000, 8.000000) scale(-1, 1) translate(-33.000000, -8.000000)">
						<svg:svg.cbtn :click.prevent.changeMaxWidth(yes) xmlns="http://www.w3.org/2000/svg" width="44" height="16" viewBox="0 0 44 16" fill="context-fill" style="padding: calc(42px - 28px) 0;">
							<svg:title> @data.lang:decrease_max_width
							<svg:path d="M14.5,7 L8.75,1.25 L10,-1.91791433e-15 L18,8 L17.375,8.625 L10,16 L8.75,14.75 L14.5,9 L1.13686838e-13,9 L1.13686838e-13,7 L14.5,7 Z" transform="translate(9.000000, 8.000000) scale(-1, 1) translate(-9.000000, -8.000000)">
							<svg:path d="M40.5,7 L34.75,1.25 L36,-5.17110888e-16 L44,8 L43.375,8.625 L36,16 L34.75,14.75 L40.5,9 L26,9 L26,7 L40.5,7 Z">
				<.btnbox>
					<svg:svg.cbtn :click.prevent.toggleParallelMode(no) style="padding: 8px;" xmlns:cc="http://creativecommons.org/ns#" xmlns:svg="http://www.w3.org/2000/svg" xmlns="http://www.w3.org/2000/svg" version="1.1" viewBox="0, 0, 400,338.0281690140845" height="338.0281690140845" width="400">
						<svg:title> @data.lang:usual_reading
						<svg:g>
							<svg:path style="stroke-width:1.81818" fill-rule="evenodd" stroke="none"
								d="m 35.947276,15.059555 c -7.969093,0.761817 -16.59819,3.661819 -16.59819,5.578181 0,0.283637 -0.409086,0.516365 -0.909082,0.516365 -0.498182,0 -1.332726,0.650909 -1.85455,1.445454 -0.52,0.794546 -2.256363,2.158182 -3.856362,3.030909 -4.2854562,2.334545 -5.9854559,4.496363 -7.5981831,9.663636 -0.7927271,2.536365 -1.6272721,4.750909 -1.8581814,4.921819 -0.2290909,0.170909 -1.0600003,2.521818 -1.845455,5.225455 L 0,50.355918 v 118.650912 118.6509 l 1.4272725,4.91455 c 0.7854547,2.70182 1.6163641,5.05454 1.845455,5.22545 0.2309093,0.17092 1.0654543,2.38546 1.8581814,4.92182 1.6127272,5.16727 3.3127269,7.32727 7.5981831,9.66364 1.599999,0.87273 3.336362,2.23636 3.856362,3.03091 0.521824,0.79455 1.356368,1.44363 1.85455,1.44363 0.499996,0 0.909082,0.23273 0.909082,0.51818 0,0.97456 6.109095,3.84182 10.278187,4.82546 7.178184,1.69455 80.296367,1.94181 87.632717,0.29818 6.04365,-1.35454 8.16365,-2.48181 9.22729,-4.90545 0.40182,-0.91091 0.87272,-1.79637 1.04909,-1.96545 5.33636,-5.1291 5.29091,-24.29273 -0.0654,-26.33274 -0.29454,-0.11268 -0.53818,-0.5109 -0.53818,-0.88363 0,-1.30001 -2.77637,-4.72909 -4.30182,-5.31454 -5.89454,-2.25456 -9.98909,-2.51091 -40.25999,-2.51091 -36.860011,0 -34.947285,0.51454 -36.567285,-9.83638 -0.858181,-5.48544 -0.858181,-198.0018 0,-203.48908 1.62,-10.350906 -0.292726,-9.83636 36.567285,-9.83636 30.2709,0 34.36545,-0.254546 40.25999,-2.51091 1.52545,-0.583635 4.30182,-4.012727 4.30182,-5.312726 0,-0.374547 0.24364,-0.772729 0.53818,-0.885456 5.35637,-2.039999 5.40182,-21.203635 0.0654,-26.332727 -0.17637,-0.16909 -0.64727,-1.052727 -1.04909,-1.965455 -1.05091,-2.392726 -3.17092,-3.545454 -8.92,-4.845453 -5.51091,-1.245455 -69.73091,-1.65091 -81.620004,-0.512728 m 246.100004,0.529091 c -5.69091,1.21091 -7.93818,2.427273 -8.91455,4.82909 -0.37092,0.912728 -1.60181,3.692727 -2.73818,6.18 -4.27454,9.361819 0.24,27.027274 7.32909,28.67091 8.94545,2.072727 10.5,2.156364 40.21636,2.156364 36.34,0 34.19273,-0.589092 35.82364,9.83636 0.85818,5.48728 0.85818,198.00364 0,203.48908 -1.63091,10.42547 0.51636,9.83638 -35.82364,9.83638 -29.71636,0 -31.27091,0.0837 -40.21636,2.15817 -7.08909,1.64183 -11.60363,19.30728 -7.32909,28.67092 1.13637,2.48545 2.36726,5.26727 2.73818,6.17818 2.17818,5.35635 7.25091,5.97636 48.9909,5.98727 47.96183,0.0107 53.39273,-0.65818 60.00001,-7.4 1.30545,-1.33091 3.97273,-3.35819 5.92728,-4.50364 5.00908,-2.93635 5.34181,-3.44363 7.8509,-12.03272 1.23454,-4.22727 2.63637,-8.98183 3.11636,-10.56727 1.30909,-4.32001 1.30909,-235.821822 0,-240.14364 -0.47999,-1.585454 -1.88182,-6.34 -3.11636,-10.565454 -2.50909,-8.589091 -2.84182,-9.098182 -7.8509,-12.032728 -1.95455,-1.147272 -4.62183,-3.172727 -5.92728,-4.505454 -6.62546,-6.76 -12.08,-7.425455 -60.30728,-7.36 -30.57272,0.04 -35.33817,0.174546 -39.76908,1.118182 M 87.376365,80.17046 c -4.607268,1.17637 -8.121822,2.99091 -9.203631,4.75273 -0.276368,0.44909 -2.036365,1.68182 -3.910922,2.74 -5.672718,3.20364 -7.954534,10.04727 -6.37817,19.13091 0.736355,4.23455 3.161809,9.6491 4.325448,9.6491 0.303645,0 2.779999,1.52726 5.505457,3.39272 8.17091,5.59636 101.970903,6.05455 126.714543,5.66182 l 107.36546,-0.32001 5.72727,-2.60363 c 7.41637,-3.3709 9.73092,-5.63091 13.21091,-12.89273 3.39091,-7.07272 3.38727,-7.00363 0.48909,-13.67818 -2.98545,-6.87273 -6.95454,-10.82363 -14.29273,-14.22363 l -5.09272,-2.36 -108.00001,-0.24 C 184.65273,78.95774 91.839996,79.03228 87.376365,80.17046 m -2.554545,68.22365 c -16.609096,1.92908 -23.163632,22.64726 -11.147273,35.23271 6.041822,6.3291 5.400003,6.20546 34.032723,6.47819 33.53273,0.32 214.32191,2.93417 217.311,-3.40764 0.68001,-1.44182 4.32537,-7.49055 5.54355,-9.29964 3.30727,-4.90545 3.30727,-11.87637 0,-16.78181 -1.21818,-1.8091 -2.77273,-4.47091 -3.45272,-5.91273 -2.89273,-6.13636 -94.60182,-6.93273 -125.25091,-6.82 -12.34183,0.0454 -115.007284,0.27454 -117.03637,0.51092 m 2.616365,65.16725 c -3.589093,0.91638 -5.980003,2.05274 -9.718185,4.61274 -2.727272,1.86726 -5.207265,3.39454 -5.51091,3.39454 -1.163639,0 -3.589093,5.41455 -4.325448,9.65091 -1.576364,9.08363 0.705452,15.92727 6.37817,19.12909 1.874557,1.05818 3.634554,2.29091 3.910922,2.74 3.005453,4.89818 101.847266,6.2 126.289086,5.81273 l 107.39819,-0.31818 5.08,-2.35455 c 7.32544,-3.39454 11.29817,-7.34909 14.28181,-14.22 2.89818,-6.67272 2.90182,-6.60364 -0.48909,-13.67637 -3.47999,-7.26545 -5.79454,-9.52181 -13.22182,-12.89999 l -5.74,-2.6091 -107.96909,-0.24 c -19.0691,-0.22 -111.976369,-0.14363 -116.363635,0.97818">
					<svg:svg.cbtn :click.prevent.toggleParallelMode(yes) style="padding: 8px;" viewBox="0 0 400 338">
						<svg:title> @data.lang:parallel
						<svg:path d=svg_paths:columnssvg style="fill:inherit;fill-rule:evenodd;stroke:none;stroke-width:1.81818187">
				<.nighttheme :click.prevent=(do show_fonts = !show_fonts)>
					<span.font_icon> "B"
					settings:font:name
					<.languages .show_languages=show_fonts>
						for font in fonts
							<button :click.prevent.setFontFamily(font) css:font-family=font:code> font:name
				<.profile_in_settings>
					if @data.user
						<a.username :click.prevent.toProfile(no)> @data.user.charAt(0).toUpperCase() + @data.user.slice(1)
						<a.prof_btn href="/accounts/logout/"> @data.lang:logout
					else
						<a.prof_btn href="/accounts/login/"> @data.lang:login
						<a.prof_btn.signin href="/signup/"> @data.lang:signin
				<.help :click.prevent.turnHistory>
					<svg:svg.helpsvg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24">
						<svg:title> @data.lang:history
						<svg:path d="M0 0h24v24H0z" fill="none">
						<svg:path d="M13 3c-4.97 0-9 4.03-9 9H1l3.89 3.89.07.14L9 12H6c0-3.87 3.13-7 7-7s7 3.13 7 7-3.13 7-7 7c-1.93 0-3.68-.79-4.94-2.06l-1.42 1.42C8.27 19.99 10.51 21 13 21c4.97 0 9-4.03 9-9s-4.03-9-9-9zm-1 5v5l4.28 2.54.72-1.21-3.5-2.08V8H12z">
					@data.lang:history
				<.nighttheme.flex :click.prevent=(do @data.show_languages = !@data.show_languages)>
					@data.lang:language
					<button.change_language> currentLanguage()
					<.languages .show_languages=@data.show_languages>
						<button :click.prevent=(do @data.setLanguage('ukr'))> "Українська"
						<button :click.prevent=(do @data.setLanguage('ru'))> "Русский"
						<button :click.prevent=(do @data.setLanguage('eng'))> "English"
						<button :click.prevent=(do @data.setLanguage('pt'))> "Portuguese"
						<button :click.prevent=(do @data.setLanguage('es'))> "Español"
				<.nighttheme.parent_checkbox.flex :click.prevent.toggleVersePicker() .checkbox_turned=settings:verse_picker>
					@data.lang:verse_picker
					<p.checkbox> <span>
				<.nighttheme.parent_checkbox.flex :click.prevent.toggleTransitions() .checkbox_turned=settings:transitions>
					@data.lang:transitions
					<p.checkbox> <span>
				<.nighttheme.parent_checkbox.flex :click.prevent.toggleVerseBreak() .checkbox_turned=settings:verse_break>
					@data.lang:verse_break
					<p.checkbox> <span>
				if window:innerWidth > 1024
					<.nighttheme.parent_checkbox.flex :click.prevent.toggleLockDrawers() .checkbox_turned=settings:lock_drawers>
						@data.lang:lock_drawers
						<p.checkbox> <span>
				if window:navigator:onLine then <a.help :click.prevent.toDownloads(no)>
					<svg:svg.helpsvg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24">
						<svg:title> @data.lang:download
						<svg:path d="M0 0h24v24H0z" fill="none">
						<svg:path d=svg_paths:download>
					@data.lang:download
				<a.help :click.prevent.turnHelpBox()>
					<svg:svg.helpsvg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24">
						<svg:title> @data.lang:help
						<svg:path fill="none" d="M0 0h24v24H0z">
						<svg:path d="M11 18h2v-2h-2v2zm1-16C6.48 2 2 6.48 2 12s4.48 10 10 10 10-4.48 10-10S17.52 2 12 2zm0 18c-4.41 0-8-3.59-8-8s3.59-8 8-8 8 3.59 8 8-3.59 8-8 8zm0-14c-2.21 0-4 1.79-4 4h2c0-1.1.9-2 2-2s2 .9 2 2c0 2-3 1.75-3 5h2c0-2.25 3-2.5 3-5 0-2.21-1.79-4-4-4z">
					@data.lang:help
				<a.help href="mailto:bpavlisinec@gmail.com">
					<svg:svg.helpsvg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24">
						<svg:title> @data.lang:feedback
						<svg:path d="M0 0h24v24H0V0z" fill="none">
						<svg:path d="M20 2H4c-1.1 0-1.99.9-1.99 2L2 22l4-4h14c1.1 0 2-.9 2-2V4c0-1.1-.9-2-2-2zm0 14H5.17l-.59.59-.58.58V4h16v12zm-9-4h2v2h-2zm0-6h2v4h-2z">
					@data.lang:feedback
				<a.help.animated-man :click.prevent.turnSupport()>
					<svg:svg.helpsvg xmlns="http://www.w3.org/2000/svg" height="24" viewBox="0 0 24 24" width="24">
						<svg:title> @data.lang:support
						<svg:path d="M20.5 6c-2.61.7-5.67 1-8.5 1s-5.89-.3-8.5-1L3 8c1.86.5 4 .83 6 1v13h2v-6h2v6h2V9c2-.17 4.14-.5 6-1l-.5-2zM12 6c1.1 0 2-.9 2-2s-.9-2-2-2-2 .9-2 2 .9 2 2 2z">
						<svg:path d="M0 0h24v24H0z" fill="none">
					@data.lang:support
				<footer>
					<p.footer_links>
						<a target="_blank" rel="noreferrer" href="http://www.patreon.com/bolls"> "Patreon"
						<a target="_blank" rel="noreferrer" href="http://t.me/bollsbible"> "Telegram"
						<a target="_blank" href="/api"> "API "
						<a target="_blank" rel="noreferrer" href="https://github.com/Bohooslav/bain/"> "GitHub"
						<a target="_blank" rel="noreferrer" href="https://send.monobank.ua/6ao79u5rFZ"> @data.lang:donate, " 🐈"
						<a target="_blank" href="/static/privacy_policy.html"> "Privacy Policy"
						<a target="_blank" rel="noreferrer" href="http://t.me/Boguslavv"> "Hire me"
					<p>
						"©",	<time time:datetime="2020-06-09T18:38"> "2019-present"
						" Павлишинець Богуслав 🎻"

			<section.search_results .show_search_results=(search:search_div || show_help || show_compare || show_downloads || show_support)>
				if what_to_show == 'show_help'
					<article.search_hat>
						<svg:svg.close_search :click.prevent.turnHelpBox() xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" tabindex="0">
							<svg:title> @data.lang:close
							<svg:path d=svg_paths:close css:margin="auto">
						<h1> @data.lang:help
						<a href="mailto:bpavlisinec@gmail.com">
							<svg:svg.filter_search xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 16 16">
								<svg:title> @data.lang:help
								<svg:g>
										<svg:path d="M16 2L0 7l3.5 2.656L14.563 2.97 5.25 10.656l4.281 3.156z">
										<svg:path d="M3 8.5v6.102l2.83-2.475-.66-.754L4 12.396V8.5z" color="#000" font-weight="400" font-family="sans-serif" white-space="normal" overflow="visible" fill-rule="evenodd">
					<article.helpFAQ.search_body tabindex="0">
						<p style="color: var(--accent-hover-color); font-size: 0.9em;"> @data.lang:faqmsg
						<h3> @data.lang:content
						<ul>
							for q in @data.lang:HB
								<li> <a href="#{q[0]}"> q[0]
							if window:innerWidth > 1024
								<li> <a href="#shortcuts"> @data.lang:shortcuts
						for q in @data.lang:HB
							<h3 id=q[0] > q[0]
							<p> q[1]
						if window:innerWidth > 1024
							<div id="shortcuts">
								<h3> @data.lang:shortcuts
								for shortcut in @data.lang:shortcuts_list
									<p> <text-as-html[{text: shortcut}]>
						<address.still_have_questions>
							@data.lang:still_have_questions
							<a href="mailto:bpavlisinec@gmail.com"> " bpavlisinec@gmail.com"
				elif what_to_show == 'show_compare'
					<article.search_hat>
						<svg:svg.close_search :click.prevent.clearSpace() xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" tabindex="0">
							<svg:title> @data.lang:close
							<svg:path d=svg_paths:close css:margin="auto">
						<h1> highlighted_title
						<svg:svg.filter_search :click.prevent=(do show_translations_for_comparison = !show_translations_for_comparison) xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" alt=@data.lang:addcollection style="stroke: var(--text-color);">
							<svg:title> @data.lang:compare
							<svg:line x1="0" y1="10" x2="20" y2="10">
							<svg:line x1="10" y1="0" x2="10" y2="20">
					<article.search_body tabindex="0">
						<.filters .show=show_translations_for_comparison>
							if compare_translations:length == translations:length
								<p style="padding:12px 8px"> @data.lang:nothing_else
							for translation in translations when !compare_translations.find(do |element| return element == translation:short_name)
									<a.book_in_list.book_in_filter dir="auto" :click.prevent.addTranslation(translation)> translation:short_name, ', ', translation:full_name
						<p.search_results_total> @data.lang:add_translations_msg
						<ul> if compare_translations:length
							for tr, key in comparison_parallel
								<compare-draggable-item[{tr: tr, key: key, lang: @data.lang, svg_paths: svg_paths}]>
						else
							<button.more_results style="margin: 16px auto; display: flex;" :click.prevent=(do show_translations_for_comparison = !show_translations_for_comparison)> @data.lang:add_translation_btn
						<.freespace>
				elif what_to_show == 'show_downloads'
					<article.search_hat>
						<svg:svg.close_search :click.prevent.clearSpace() xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" tabindex="0">
							<svg:title> @data.lang:close
							<svg:path d=svg_paths:close css:margin="auto">
						<h1> @data.lang:download_translations
						if @data:deleting_of_all_transllations()
							<svg:svg.close_search.animated_downloading xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 16 16">
								<svg:title> @data.lang:loading
								<svg:path d=svg_paths:loading style="marker:none" color="#000" overflow="visible" fill="var(--text-color)">
						else
							<svg:svg.close_search :click.prevent=(do @data.clearVersesTable()) xmlns="http://www.w3.org/2000/svg" viewBox="0 0 12 16" alt=@data.lang:delete>
								<svg:title> @data.lang:remove_all_translations
								<svg:path fill-rule="evenodd" clip-rule="evenodd" d="M11 2H9C9 1.45 8.55 1 8 1H5C4.45 1 4 1.45 4 2H2C1.45 2 1 2.45 1 3V4C1 4.55 1.45 5 2 5V14C2 14.55 2.45 15 3 15H10C10.55 15 11 14.55 11 14V5C11.55 5 12 4.55 12 4V3C12 2.45 11.55 2 11 2ZM10 14H3V5H4V13H5V5H6V13H7V5H8V13H9V5H10V14ZM11 4H2V3H11V4Z">
					<article.search_body tabindex="0">
						for language in languages
							<a.book_in_list dir="auto" style="padding: 12px 8px 12px 0px;" .pressed=(language:language == show_language_of) :click.prevent.showLanguageTranslations(language:language) tabindex="0">
								language:language
								<svg:svg.arrow_next xmlns="http://www.w3.org/2000/svg" width="8" height="5" viewBox="0 0 8 5">
									<svg:title> @data.lang:open
									<svg:polygon points="4,3 1,0 0,1 4,5 8,1 7,0">
							<ul.list_of_chapters dir="auto" .show_list_of_chapters=(language:language == show_language_of)>
								for tr in language:translations
									<a.search_res_verse_header>
										<.search_res_verse_text style="margin-right: auto;text-align: left;"> tr:short_name, ', ', tr:full_name
										if @data:downloading_of_this_translations().find(do |translation| return translation == tr:short_name)
											<svg:svg.remove_parallel.close_search.animated_downloading xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 16 16">
												<svg:title> @data.lang:loading
												<svg:path d=svg_paths:loading style="marker:none" color="#000" overflow="visible" fill="var(--text-color)">
										elif @data:downloaded_translations().indexOf(tr:short_name) != -1
											<svg:svg.remove_parallel.close_search :click.prevent=(do @data.deleteTranslation(tr:short_name)) xmlns="http://www.w3.org/2000/svg" viewBox="0 0 12 16" alt=@data.lang:delete>
												<svg:title> @data.lang:delete
												<svg:path fill-rule="evenodd" clip-rule="evenodd" d="M11 2H9C9 1.45 8.55 1 8 1H5C4.45 1 4 1.45 4 2H2C1.45 2 1 2.45 1 3V4C1 4.55 1.45 5 2 5V14C2 14.55 2.45 15 3 15H10C10.55 15 11 14.55 11 14V5C11.55 5 12 4.55 12 4V3C12 2.45 11.55 2 11 2ZM10 14H3V5H4V13H5V5H6V13H7V5H8V13H9V5H10V14ZM11 4H2V3H11V4Z">
										else
											<svg:svg.remove_parallel.close_search :click.prevent=(do @data.downloadTranslation(tr:short_name)) xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24">
												<svg:title> @data.lang:download
												<svg:path d="M0 0h24v24H0z" fill="none">
												<svg:path d=svg_paths:download>
						<.freespace>
				elif what_to_show == 'show_support'
					<article.search_hat>
						<svg:svg.close_search :click.prevent.turnSupport() xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" tabindex="0">
							<svg:title> @data.lang:close
							<svg:path d=svg_paths:close css:margin="auto">
						<h1> @data.lang:support
						<a href="mailto:bpavlisinec@gmail.com">
							<svg:svg.filter_search xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 16 16">
								<svg:title> @data.lang:help
								<svg:g>
										<svg:path d="M16 2L0 7l3.5 2.656L14.563 2.97 5.25 10.656l4.281 3.156z">
										<svg:path d="M3 8.5v6.102l2.83-2.475-.66-.754L4 12.396V8.5z" color="#000" font-weight="400" font-family="sans-serif" white-space="normal" overflow="visible" fill-rule="evenodd">
					<article.helpFAQ.search_body>
						<h3> @data.lang:ycdtitnw
						<ul> for i in @data.lang:SUPPORT
							<li> <text-as-html[{text: i}]>
						<h3> @data.lang:bgthnkst, ":"
						<ul> for i in thanks_to
							<li> <text-as-html[{text: i}]>
				else
					<article.search_hat>
						<svg:svg.close_search :click.prevent.closeSearch(true) xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" tabindex="0">
							<svg:title> @data.lang:close
							<svg:path d=svg_paths:close css:margin="auto">
						<h1> search:search_result_header
						<svg:svg.filter_search .filter_search_hover=search:show_filters||search:is_filter :click.prevent=(do search:show_filters = !search:show_filters) xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" tabindex="0">
							<svg:title> @data.lang:addfilter
							<svg:path d="M12 12l8-8V0H0v4l8 8v8l4-4v-4z">
					<article#search_body.search_body tabindex="0">
						if @search_verses:length
							<.filters .show=search:show_filters>
								if settingsp:edited_version == settingsp:translation && settingsp:display
									if search:is_filter then <a.book_in_list :click.prevent.dropFilter> @data.lang:drop_filter
									for book in @parallel_books
										<a.book_in_list.book_in_filter dir="auto" :click.prevent.addFilter(book:bookid)> book:name
								else
									if search:is_filter then <a.book_in_list :click.prevent.dropFilter> @data.lang:drop_filter
									for book in @books when @search:bookid_of_results.find(do |element| return element == book:bookid)
										<a.book_in_list.book_in_filter dir="auto" :click.prevent.addFilter(book:bookid)> book:name
							if search:is_filter
								<p.search_results_total> getFilteredArray:length, ' ', @data.lang:totalyresultsofsearch
								for verse, key in getFilteredArray
									<a.search_item>
										<search-text-as-html[verse].search_res_verse_text>
										<.search_res_verse_header>
											<span> nameOfBook(verse:book, (settingsp:display ? settingsp:edited_version : settings:translation)), ' '
											<span> verse:chapter, ':'
											<span> verse:verse
											<svg:svg.open_in_parallel :click.prevent.copyToClipboardFromSerach(verse) xmlns="http://www.w3.org/2000/svg" viewBox="0 0 561 561" alt=@data.lang:copy>
												<svg:title> @data.lang:copy
												<svg:path d=svg_paths:copy>
											<svg:svg.open_in_parallel style="margin-left: 4px;" viewBox="0 0 400 338" :click.prevent.backInHistory({translation: @search:translation, book: verse:book, chapter: verse:chapter,verse: verse:verse}, yes)>
												<svg:title> @data.lang:open_in_parallel
												<svg:path d=svg_paths:columnssvg style="fill:inherit;fill-rule:evenodd;stroke:none;stroke-width:1.81818187">
									if key > search:counter
										<button.more_results :click.prevent=(do search:counter += 50) tabindex="0"> @data.lang:more_results
										break
								<div css:padding='12px 0px' css:text-align="center">
									@data.lang:filter_name, ' ', nameOfBook(search:filter, (settingsp:display ? settingsp:edited_version : settings:translation))
									<br>
									<a.more_results css:display="inline-block" css:margin-top="12px" :click.prevent.dropFilter> @data.lang:drop_filter
							else
								<p.search_results_total> @search_verses:length, ' ', @data.lang:totalyresultsofsearch
								for verse, key in @search_verses
									<a.search_item>
										<search-text-as-html[verse].search_res_verse_text>
										<.search_res_verse_header>
											<span> nameOfBook(verse:book, (settingsp:display ? settingsp:edited_version : settings:translation)), ' '
											<span> verse:chapter, ':'
											<span> verse:verse
											<svg:svg.open_in_parallel :click.prevent.copyToClipboardFromSerach(verse) xmlns="http://www.w3.org/2000/svg" viewBox="0 0 561 561" alt=@data.lang:copy>
												<svg:title> @data.lang:copy
												<svg:path d=svg_paths:copy>
											<svg:svg.open_in_parallel style="margin-left: 4px;" viewBox="0 0 400 338" :click.prevent.backInHistory({translation: @search:translation, book: verse:book, chapter: verse:chapter,verse: verse:verse}, yes)>
												<svg:title> @data.lang:open_in_parallel
												<svg:path d=svg_paths:columnssvg style="fill:inherit;fill-rule:evenodd;stroke:none;stroke-width:1.81818187">
									if key > search:counter
										<button.more_results :click.prevent=(do search:counter += 50) tabindex="0" style="margin: auto; display: flex;"> @data.lang:more_results
										break
							<.freespace>
						else
							<div style="display:flex;flex-direction:column;height:100%;justify-content:center;align-items:center">
								<p css:margin-top="32px" css:text-align="center"> @data.lang:nothing
								<p css:padding="32px 0px 8px"> @data.lang:translation, ' ', search:search_result_translation
								<button.more_results :click.prevent.showTranslations> @data.lang:change_translation

			<section.hide .without_padding=(show_collections || show_share_box) .choosen_verses=choosenid:length>
				if show_collections
					<.collectionshat>
						<svg:svg.svgBack xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" :click.prevent.turnCollections>
							<svg:title> @data.lang:back
							<svg:path d="M3.828 9l6.071-6.071-1.414-1.414L0 10l.707.707 7.778 7.778 1.414-1.414L3.828 11H20V9H3.828z">
						if addcollection
							<p.saveto> @data.lang:newcollection
						else
							<p.saveto> @data.lang:saveto
							<svg:svg.svgAdd :click.prevent.addCollection xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" alt=@data.lang:addcollection>
								<svg:title> @data.lang:addcollection
								<svg:line x1="0" y1="10" x2="20" y2="10">
								<svg:line x1="10" y1="0" x2="10" y2="20">
					<.mark_grid>
						if addcollection
							<input[store:newcollection].newcollectioninput :keydown.enter.prevent.addNewCollection(store:newcollection) id="newcollectioninput" type="text">
						elif @categories:length
							for category in @categories
								if category
									<p.collection
									.add_new_collection=(choosen_categories.find(do |element| return element == category))
									:click.prevent.addNewCollection(category)> category
							<div css:min-width="16px">
						else
							<p.collection.add_new_collection css:margin="8px auto" :click.prevent.addCollection> @data.lang:addcollection
					if (store:newcollection && addcollection) || (choosen_categories:length && !addcollection)
						<button.cancel.add_new_collection :click.prevent.addNewCollection(store:newcollection)> @data.lang:save
					else
						<button.cancel :click.prevent.turnCollections> @data.lang:cancel
				elif show_share_box
					<.collectionshat>
						<p.saveto> @data.lang:share_via
					<.mark_grid>
						<.share_box :click.prevent=(do @data.shareCopying(getShareObj()) && clearSpace())>
							<svg:svg.share_btn xmlns="http://www.w3.org/2000/svg" viewBox="0 0 561 561" alt=@data.lang:copy fill="var(--text-color)">
								<svg:title> @data.lang:copy
								<svg:path d=svg_paths:copy>
						if canShareViaTelegram() then <.share_box :click.prevent.shareTelegram()>
							<svg:svg.share_btn xmlns="http://www.w3.org/2000/svg" viewBox="0 0 240 240" style="background: linear-gradient(#37aee2, #1e96c8); border-radius: 50%;" alt="Telegram">
								<svg:title> "Telegram"
								<svg:g transform="matrix(3.468208 0 0 3.468208 0 -.00001)">
									<svg:path d="M14.4 34.3l23.3-9.6c2.3-1 10.1-4.2 10.1-4.2s3.6-1.4 3.3 2c-.1 1.4-.9 6.3-1.7 11.6l-2.5 15.7s-.2 2.3-1.9 2.7-4.5-1.4-5-1.8c-.4-.3-7.5-4.8-10.1-7-.7-.6-1.5-1.8.1-3.2 3.6-3.3 7.9-7.4 10.5-10 1.2-1.2 2.4-4-2.6-.6l-14.1 9.5s-1.6 1-4.6.1-6.5-2.1-6.5-2.1-2.4-1.5 1.7-3.1z" fill="#fff">
						if canMakeTweet() then <.share_box :click.prevent.makeTweet()>
							<svg:svg.share_btn viewBox="0 0 24 24" alt="Twitter">
								<svg:title> "Twitter"
								<svg:g>
									<svg:path d="M23.643 4.937c-.835.37-1.732.62-2.675.733.962-.576 1.7-1.49 2.048-2.578-.9.534-1.897.922-2.958 1.13-.85-.904-2.06-1.47-3.4-1.47-2.572 0-4.658 2.086-4.658 4.66 0 .364.042.718.12 1.06-3.873-.195-7.304-2.05-9.602-4.868-.4.69-.63 1.49-.63 2.342 0 1.616.823 3.043 2.072 3.878-.764-.025-1.482-.234-2.11-.583v.06c0 2.257 1.605 4.14 3.737 4.568-.392.106-.803.162-1.227.162-.3 0-.593-.028-.877-.082.593 1.85 2.313 3.198 4.352 3.234-1.595 1.25-3.604 1.995-5.786 1.995-.376 0-.747-.022-1.112-.065 2.062 1.323 4.51 2.093 7.14 2.093 8.57 0 13.255-7.098 13.255-13.254 0-.2-.005-.402-.014-.602.91-.658 1.7-1.477 2.323-2.41z" fill="#1da1f2">
						<.share_box :click.prevent.shareViaFB()>
							<svg:svg.share_btn version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 64 64" style="border-radius: 23%;enable-background:new 0 0 64 64;" xml:space="preserve" alt="Facebook">
								<svg:title> "Facebook"
								<svg:path fill="#3D5A98" d="M60.5,64c2,0,3.5-1.6,3.5-3.5V3.5c0-2-1.6-3.5-3.5-3.5H3.5C1.6,0,0,1.6,0,3.5v56.9  c0,2,1.6,3.5,3.5,3.5H60.5z">
								<svg:path fill="#FFFFFF" d="M44.2,64V39.2h8.3l1.2-9.7h-9.6v-6.2c0-2.8,0.8-4.7,4.8-4.7l5.1,0V10c-0.9-0.1-3.9-0.4-7.5-0.4  c-7.4,0-12.4,4.5-12.4,12.8v7.1h-8.3v9.7h8.3V64H44.2z">
						<.share_box :click.prevent.shareViaWhatsApp()>
							<svg:svg.share_btn version="1.1" id="Capa_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 512.303 512.303" style="enable-background:new 0 0 512.303 512.303;" xml:space="preserve" alt="WhatsApp">
								<svg:title> "WhatsApp"
								<svg:path style="fill:#4CAF50;" d="M256.014,0.134C114.629,0.164,0.038,114.804,0.068,256.189c0.01,48.957,14.059,96.884,40.479,138.1 L0.718,497.628c-2.121,5.496,0.615,11.671,6.111,13.792c1.229,0.474,2.534,0.717,3.851,0.715c1.222,0.006,2.435-0.203,3.584-0.619 l106.667-38.08c120.012,74.745,277.894,38.048,352.638-81.965s38.048-277.894-81.965-352.638 C350.922,13.495,303.943,0.087,256.014,0.134z">
								<svg:path style="fill:#FAFAFA;" d="M378.062,299.889c0,0-26.133-12.8-42.496-21.333c-18.517-9.536-40.277,8.32-50.517,18.475 c-15.937-6.122-30.493-15.362-42.816-27.179c-11.819-12.321-21.059-26.877-27.179-42.816c10.155-10.261,27.968-32,18.475-50.517 c-8.427-16.384-21.333-42.496-21.333-42.517c-1.811-3.594-5.49-5.863-9.515-5.867h-21.333c-31.068,5.366-53.657,32.474-53.333,64 c0,33.493,40.085,97.835,67.115,124.885s91.371,67.115,124.885,67.115c31.526,0.324,58.634-22.266,64-53.333v-21.333 C384.018,305.401,381.71,301.686,378.062,299.889z">
						<.share_box :click.prevent.shareViaVK()>
							<svg:svg.share_btn xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1" width="445" height="445" viewBox="0 0 445 445" xml:space="preserve">
								<svg:title> "Vkontakte"
								<svg:g id="icon" style="stroke: none; stroke-width: 1; stroke-dasharray: none; stroke-linecap: butt; stroke-linejoin: miter; stroke-miterlimit: 10; fill: none; fill-rule: nonzero; opacity: 1;" transform="translate(-2.4722222222222285 -2.4722222222222285) scale(4.94 4.94)">
									<svg:path d="M 31.2 0 c 25.2 0 2.4 0 27.6 0 S 90 6 90 31.2 s 0 2.4 0 27.6 S 84 90 58.8 90 s -2.4 0 -27.6 0 S 0 84 0 58.8 s 0 -13.528 0 -27.6 C 0 6 6 0 31.2 0 z" style="stroke: none; stroke-width: 1; stroke-dasharray: none; stroke-linecap: butt; stroke-linejoin: miter; stroke-miterlimit: 10; fill: rgb(81,129,184); fill-rule: nonzero; opacity: 1;" transform=" matrix(1 0 0 1 0 0) " stroke-linecap="round">
									<svg:path d="M 73.703 31.006 c 0.417 -1.391 0 -2.412 -1.985 -2.412 h -6.563 c -1.669 0 -2.438 0.883 -2.855 1.856 c 0 0 -3.337 8.134 -8.065 13.418 c -1.53 1.53 -2.225 2.016 -3.059 2.016 c -0.417 0 -1.021 -0.487 -1.021 -1.877 V 31.006 c 0 -1.669 -0.484 -2.412 -1.875 -2.412 H 37.969 c -1.043 0 -1.67 0.774 -1.67 1.508 c 0 1.582 2.364 1.947 2.607 6.396 v 9.664 c 0 2.119 -0.383 2.503 -1.217 2.503 c -2.225 0 -7.636 -8.171 -10.846 -17.52 c -0.629 -1.817 -1.26 -2.551 -2.937 -2.551 h -6.563 c -1.875 0 -2.25 0.883 -2.25 1.856 c 0 1.738 2.225 10.359 10.359 21.761 c 5.423 7.787 13.063 12.008 20.016 12.008 c 4.171 0 4.688 -0.938 4.688 -2.552 v -5.885 c 0 -1.875 0.395 -2.249 1.716 -2.249 c 0.973 0 2.642 0.487 6.535 4.241 c 4.45 4.45 5.183 6.446 7.686 6.446 h 6.563 c 1.875 0 2.813 -0.938 2.272 -2.788 c -0.592 -1.844 -2.716 -4.519 -5.535 -7.691 c -1.53 -1.808 -3.824 -3.754 -4.519 -4.728 c -0.973 -1.251 -0.695 -1.808 0 -2.92 C 64.874 46.093 72.869 34.83 73.703 31.006 z" style="stroke: none; stroke-width: 1; stroke-dasharray: none; stroke-linecap: butt; stroke-linejoin: miter; stroke-miterlimit: 10; fill: rgb(255,255,255); fill-rule: nonzero; opacity: 1;" transform=" matrix(1 0 0 1 0 0) " stroke-linecap="round">
						<.share_box :click.prevent.shareViaViber()>
							<svg:svg.share_btn version="1.1" id="Capa_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 455.731 455.731" style="border-radius: 23%;enable-background:new 0 0 455.731 455.731;" xml:space="preserve">
								<svg:title> "Viber"
								<svg:g>
									<svg:rect x="0" y="0" style="fill:#7D3DAF;" width="455.731" height="455.731">
									<svg:g>
										<svg:path style="fill:#FFFFFF;" d="M371.996,146.901l-0.09-0.36c-7.28-29.43-40.1-61.01-70.24-67.58l-0.34-0.07
										c-48.75-9.3-98.18-9.3-146.92,0l-0.35,0.07c-30.13,6.57-62.95,38.15-70.24,67.58l-0.08,0.36c-9,41.1-9,82.78,0,123.88l0.08,0.36
										c6.979,28.174,37.355,58.303,66.37,66.589v32.852c0,11.89,14.49,17.73,22.73,9.15l33.285-34.599
										c7.219,0.404,14.442,0.629,21.665,0.629c24.54,0,49.09-2.32,73.46-6.97l0.34-0.07c30.14-6.57,62.96-38.15,70.24-67.58l0.09-0.36
										C380.996,229.681,380.996,188.001,371.996,146.901z M345.656,264.821c-4.86,19.2-29.78,43.07-49.58,47.48
										c-25.921,4.929-52.047,7.036-78.147,6.313c-0.519-0.014-1.018,0.187-1.38,0.559c-3.704,3.802-24.303,24.948-24.303,24.948
										l-25.85,26.53c-1.89,1.97-5.21,0.63-5.21-2.09v-54.422c0-0.899-0.642-1.663-1.525-1.836c-0.005-0.001-0.01-0.002-0.015-0.003
										c-19.8-4.41-44.71-28.28-49.58-47.48c-8.1-37.15-8.1-74.81,0-111.96c4.87-19.2,29.78-43.07,49.58-47.48
										c45.27-8.61,91.17-8.61,136.43,0c19.81,4.41,44.72,28.28,49.58,47.48C353.765,190.011,353.765,227.671,345.656,264.821z">
										<svg:path style="fill:#FFFFFF;" d="M270.937,289.942c-3.044-0.924-5.945-1.545-8.639-2.663
										c-27.916-11.582-53.608-26.524-73.959-49.429c-11.573-13.025-20.631-27.73-28.288-43.292c-3.631-7.38-6.691-15.049-9.81-22.668
										c-2.844-6.948,1.345-14.126,5.756-19.361c4.139-4.913,9.465-8.673,15.233-11.444c4.502-2.163,8.943-0.916,12.231,2.9
										c7.108,8.25,13.637,16.922,18.924,26.485c3.251,5.882,2.359,13.072-3.533,17.075c-1.432,0.973-2.737,2.115-4.071,3.214
										c-1.17,0.963-2.271,1.936-3.073,3.24c-1.466,2.386-1.536,5.2-0.592,7.794c7.266,19.968,19.513,35.495,39.611,43.858
										c3.216,1.338,6.446,2.896,10.151,2.464c6.205-0.725,8.214-7.531,12.562-11.087c4.25-3.475,9.681-3.521,14.259-0.624
										c4.579,2.898,9.018,6.009,13.43,9.153c4.331,3.086,8.643,6.105,12.638,9.623c3.841,3.383,5.164,7.821,3.001,12.412
										c-3.96,8.408-9.722,15.403-18.034,19.868C276.387,288.719,273.584,289.127,270.937,289.942
										C267.893,289.017,273.584,289.127,270.937,289.942z">
										<svg:path style="fill:#FFFFFF;" d="M227.942,131.471c36.515,1.023,66.506,25.256,72.933,61.356c1.095,6.151,1.485,12.44,1.972,18.683
										c0.205,2.626-1.282,5.121-4.116,5.155c-2.927,0.035-4.244-2.414-4.434-5.039c-0.376-5.196-0.637-10.415-1.353-15.568
										c-3.78-27.201-25.47-49.705-52.545-54.534c-4.074-0.727-8.244-0.918-12.371-1.351c-2.609-0.274-6.026-0.432-6.604-3.675
										c-0.485-2.719,1.81-4.884,4.399-5.023C226.527,131.436,227.235,131.468,227.942,131.471
										C264.457,132.494,227.235,131.468,227.942,131.471z">
										<svg:path style="fill:#FFFFFF;" d="M283.434,203.407c-0.06,0.456-0.092,1.528-0.359,2.538c-0.969,3.666-6.527,4.125-7.807,0.425
										c-0.379-1.098-0.436-2.347-0.438-3.529c-0.013-7.734-1.694-15.46-5.594-22.189c-4.009-6.916-10.134-12.73-17.318-16.248
										c-4.344-2.127-9.042-3.449-13.803-4.237c-2.081-0.344-4.184-0.553-6.275-0.844c-2.534-0.352-3.887-1.967-3.767-4.464
										c0.112-2.34,1.822-4.023,4.372-3.879c8.38,0.476,16.474,2.287,23.924,6.232c15.15,8.023,23.804,20.687,26.33,37.597
										c0.114,0.766,0.298,1.525,0.356,2.294C283.198,199.002,283.288,200.903,283.434,203.407
										C283.374,203.863,283.288,200.903,283.434,203.407z">
										<svg:path style="fill:#FFFFFF;" d="M260.722,202.523c-3.055,0.055-4.69-1.636-5.005-4.437c-0.219-1.953-0.392-3.932-0.858-5.832
										c-0.918-3.742-2.907-7.21-6.055-9.503c-1.486-1.083-3.17-1.872-4.934-2.381c-2.241-0.647-4.568-0.469-6.804-1.017
										c-2.428-0.595-3.771-2.561-3.389-4.839c0.347-2.073,2.364-3.691,4.629-3.527c14.157,1.022,24.275,8.341,25.719,25.007
										c0.102,1.176,0.222,2.419-0.039,3.544C263.539,201.464,262.113,202.429,260.722,202.523
										C257.667,202.578,262.113,202.429,260.722,202.523z">
					<button.cancel :click.prevent=(do show_share_box = no)> @data.lang:cancel
				else
					if show_color_picker
						if window:innerWidth < 600
							<svg:svg.close_colorpicker
								:click.prevent=(do show_color_picker = !show_color_picker)
								xmlns="http://www.w3.org/2000/svg" viewBox="0 0 12 16" tabindex="0"
							>
								<svg:title> @data.lang:close
								<svg:path fill-rule="evenodd" clip-rule="evenodd" d="M12 5L4 13L0 9L1.5 7.5L4 10L10.5 3.5L12 5Z">
						<colorpicker .show-canvas=show_color_picker width="320" height="207" canvas:alt=@data.lang:canvastitle id="" tabindex="0">  @data.lang:canvastitle
					<p> highlighted_title, ' ', choosen_parallel == "first" ? settings:translation : settingsp:translation
					<ul.mark_grid>
						for highlight in highlights.slice().reverse()
							<li.color_mark css:background=highlight :click.prevent.changeHighlightColor(highlight)>
								<svg:svg.delete_color
										:click.prevent.deleteColor(highlight)
										xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" tabindex="0"
										>
									<svg:title> @data.lang:delete
									<svg:path d=svg_paths:close>
						<li.color_mark css:background="FireBrick" :click.prevent.changeHighlightColor("#b22222")>
						<li.color_mark css:background="Chocolate" :click.prevent.changeHighlightColor("#d2691e")>
						<li.color_mark css:background="GoldenRod" :click.prevent.changeHighlightColor("#daa520")>
						<li.color_mark css:background="OliveDrab" :click.prevent.changeHighlightColor("#6b8e23")>
						<li.color_mark css:background="RoyalBlue" :click.prevent.changeHighlightColor("#4169e1")>
						<li.color_mark css:background="#984da5" :click.prevent.changeHighlightColor("#984da5")>
						<li.color_mark
							css:border="none"
							css:background="linear-gradient(217deg, rgba(255,0,0,.8), rgba(255,0,0,0) 70.71%),
							linear-gradient(127deg, rgba(0,255,0,.8), rgba(0,255,0,0) 70.71%),
							linear-gradient(336deg, rgba(0,0,255,.8), rgba(0,0,255,0) 70.71%)"
							:click.prevent=(do show_color_picker = !show_color_picker)>
					<#addbuttons>
						<svg:svg.close_search :click.prevent.deleteBookmarks(choosenid) xmlns="http://www.w3.org/2000/svg" viewBox="0 0 12 16" alt=@data.lang:delete>
							<svg:title> @data.lang:delete
							<svg:path fill-rule="evenodd" clip-rule="evenodd" d="M11 2H9C9 1.45 8.55 1 8 1H5C4.45 1 4 1.45 4 2H2C1.45 2 1 2.45 1 3V4C1 4.55 1.45 5 2 5V14C2 14.55 2.45 15 3 15H10C10.55 15 11 14.55 11 14V5C11.55 5 12 4.55 12 4V3C12 2.45 11.55 2 11 2ZM10 14H3V5H4V13H5V5H6V13H7V5H8V13H9V5H10V14ZM11 4H2V3H11V4Z">
						<svg:svg.close_search :click.prevent.clearSpace() xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" alt=@data.lang:close>
							<svg:title> @data.lang:close
							<svg:path d=svg_paths:close alt=@data.lang:close>
						<svg:svg.save_bookmark :click.prevent=(do show_share_box = yes) xmlns="http://www.w3.org/2000/svg" height="24" viewBox="0 0 24 24" width="24">
							<svg:title> @data.lang:share
							<svg:path d="M18 16.08c-.76 0-1.44.3-1.96.77L8.91 12.7c.05-.23.09-.46.09-.7s-.04-.47-.09-.7l7.05-4.11c.54.5 1.25.81 2.04.81 1.66 0 3-1.34 3-3s-1.34-3-3-3-3 1.34-3 3c0 .24.04.47.09.7L8.04 9.81C7.5 9.31 6.79 9 6 9c-1.66 0-3 1.34-3 3s1.34 3 3 3c.79 0 1.5-.31 2.04-.81l7.12 4.16c-.05.21-.08.43-.08.65 0 1.61 1.31 2.92 2.92 2.92 1.61 0 2.92-1.31 2.92-2.92s-1.31-2.92-2.92-2.92z">
						<svg:svg.save_bookmark :click.prevent.copyToClipboard() xmlns="http://www.w3.org/2000/svg" viewBox="0 0 561 561" alt=@data.lang:copy>
							<svg:title> @data.lang:copy
							<svg:path d=svg_paths:copy>
						<svg:svg.save_bookmark :click.prevent.toggleCompare() version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" width="580.125px" height="580.125px" viewBox="0 0 580.125 580.125" style="enable-background:new 0 0 580.125 580.125; transform: rotate(90deg);" xml:space="preserve">
							<svg:title> @data.lang:compare
							<svg:path d="M573.113,298.351l-117.301-117.3c-3.824-3.825-10.199-5.1-15.299-2.55c-5.102,2.55-8.926,7.65-8.926,12.75v79.05    c-38.25,0-70.125,6.375-96.9,19.125V145.35h73.951c6.375,0,11.475-3.825,12.75-8.925c2.549-5.1,1.273-11.475-2.551-15.3    L301.537,3.825C298.988,1.275,295.162,0,291.338,0c-3.825,0-7.65,1.275-10.2,3.825l-118.575,117.3    c-3.825,3.825-5.1,10.2-2.55,15.3c2.55,5.1,7.65,8.925,12.75,8.925h75.225v142.8c-26.775-12.75-58.65-19.125-98.175-19.125v-79.05    c0-6.375-3.825-11.475-8.925-12.75c-5.1-2.55-11.475-1.275-15.3,2.55l-117.3,117.3c-2.55,2.55-3.825,6.375-3.825,10.2    s1.275,7.649,3.825,10.2l117.3,117.3c3.825,3.825,10.2,5.1,15.3,2.55c5.1-2.55,8.925-7.65,8.925-12.75v-66.3    c72.675,0,96.9,24.225,96.9,98.175v79.05c0,24.226,19.125,43.351,42.075,44.625h2.55c22.949-1.274,42.074-20.399,42.074-44.625    v-79.05c0-73.95,22.951-98.175,96.9-98.175v66.3c0,6.375,3.826,11.475,8.926,12.75c5.1,2.55,11.475,1.275,15.299-2.55    l117.301-117.3c2.551-2.551,3.824-6.375,3.824-10.2S575.662,300.9,573.113,298.351z">
						<svg:svg.save_bookmark .filled=choosen_categories:length :click.prevent.turnCollections() xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" alt=@data.lang:addtocollection>
							<svg:title> @data.lang:addtocollection
							<svg:path d="M2 2c0-1.1.9-2 2-2h12a2 2 0 0 1 2 2v18l-8-4-8 4V2zm2 0v15l6-3 6 3V2H4z">

						<svg:svg.save_bookmark css:padding="10px 0" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 12 16" :click.prevent.sendBookmarksToDjango alt=@data.lang:create>
							<svg:title> @data.lang:create
							<svg:path fill-rule="evenodd" clip-rule="evenodd" d="M12 5L4 13L0 9L1.5 7.5L4 10L10.5 3.5L12 5Z">

			<section.history.filters .show_history=show_history>
				<.nighttheme.flex css:margin="0">
					<svg:svg.close_search :click.prevent.turnHistory() xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" tabindex="0" css:margin="0 8px">
							<svg:title> @data.lang:close
							<svg:path d=svg_paths:close>
					<h1 css:margin="0 0 0 8px"> @data.lang:history
					<svg:svg.close_search :click.prevent.clearHistory() xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" style="padding: 0; margin: 0 12px 0 16px; width: 32px;" alt=@data.lang:delete css:margin-left="auto">
						<svg:title> @data.lang:delete
						<svg:path d="M15 16h4v2h-4v-2zm0-8h7v2h-7V8zm0 4h6v2h-6v-2zM3 20h10V8H3v12zM14 5h-3l-1-1H6L5 5H2v2h12V5z">
				<article.historylist>
					if @history:length
						for h in @history.slice().reverse
							<div css:display="flex">
								<a.book_in_list :click.prevent.backInHistory(h)>
									getNameOfBookFromHistory(h:translation, h:book), ' ', h:chapter
									if h:verse
										':' + h:verse
									' ', h:translation
								<svg:svg.open_in_parallel viewBox="0 0 400 338" :click.prevent.backInHistory(h, yes)>
									<svg:title> @data.lang:open_in_parallel
									<svg:path d=svg_paths:columnssvg style="fill:inherit;fill-rule:evenodd;stroke:none;stroke-width:1.81818187">
					else
						<p css:padding="12px"> @data.lang:empty_history

			if menuicons
				<svg:svg.navigation :click.prevent.toggleBibleMenu() style="left: 0;" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 16 16">
					<svg:title> @data.lang:change_book
					<svg:path d="M3 5H7V6H3V5ZM3 8H7V7H3V8ZM3 10H7V9H3V10ZM14 5H10V6H14V5ZM14 7H10V8H14V7ZM14 9H10V10H14V9ZM16 3V12C16 12.55 15.55 13 15 13H9.5L8.5 14L7.5 13H2C1.45 13 1 12.55 1 12V3C1 2.45 1.45 2 2 2H7.5L8.5 3L9.5 2H15C15.55 2 16 2.45 16 3ZM8 3.5L7.5 3H2V12H8V3.5ZM15 3H9.5L9 3.5V12H15V3Z">
				<svg:svg.navigation :click.prevent.toggleSettingsMenu() style="right: 0; transform: scaleY(0.8);" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 12 10">
					<svg:title> @data.lang:other
					<svg:path fill-rule="evenodd" clip-rule="evenodd" d="M11.41 6H0.59C0 6 0 5.59 0 5C0 4.41 0 4 0.59 4H11.4C11.99 4 11.99 4.41 11.99 5C11.99 5.59 11.99 6 11.4 6H11.41ZM11.41 2H0.59C0 2 0 1.59 0 1C0 0.41 0 0 0.59 0H11.4C11.99 0 11.99 0.41 11.99 1C11.99 1.59 11.99 2 11.4 2H11.41ZM0.59 8H11.4C11.99 8 11.99 8.41 11.99 9C11.99 9.59 11.99 10 11.4 10H0.59C0 10 0 9.59 0 9C0 8.41 0 8 0.59 8Z">

			if loading
				<Load style="position: fixed; top: 50%; left: 50%;">

			if settings:verse_picker
				<section.verse_picker.filters .show=(show_verse_picker || show_parallel_verse_picker)>
					<.flex>
						<h1 style="margin: 0 auto;font-size: 1.3em;line-height: 1;"> @data.lang:choose_verse
						<svg:svg.close_search :click.prevent.hideVersePicker() xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" tabindex="0" css:margin="0 8px">
							<svg:title> @data.lang:close
							<svg:path d=svg_paths:close>
					<.list_of_chapters.show_list_of_chapters style="margin: 0">
						if show_verse_picker
							for i in [0..@verses:length]
								<a.chapter_number :tap.hideVersePicker() href="#{i + 1}"> i + 1
						elif show_parallel_verse_picker
							for j in [0..@parallel_verses:length]
								<a.chapter_number :tap.hideVersePicker() href="#p{j + 1}"> j + 1